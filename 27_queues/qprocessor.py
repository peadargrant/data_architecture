#!/usr/bin/env python3
# AMQP Queue processor template example
# Peadar Grant

import pika
import time
import sys
import os
from argparse import ArgumentParser

def main():

    parser = ArgumentParser()
    parser.add_argument('--host', required=True, help='AMQP host name or IP')
    parser.add_argument('--vhost', required=True, help='AMQP vhost name')
    parser.add_argument('--username', required=True, help='AMQP username')
    parser.add_argument('--password', required=True, help='AMQP password')
    parser.add_argument('--queue', required=True, help='AMQP queue name')
    parser.add_argument('--lose-every', type=int, default=0, help='lost every x messages')
    parser.add_argument('--acknowledge', default=False, help='explicit acknowledge', action='store_true')
    args = parser.parse_args()
    
    # credentials
    from pika.credentials import PlainCredentials
    credentials = PlainCredentials(args.username,args.password)
    
    # setup the connection parameters
    params = pika.ConnectionParameters(args.host,virtual_host=args.vhost, credentials=credentials, heartbeat=3600)

    # create a connection object
    connection = pika.BlockingConnection(params)

    # create channel
    channel = connection.channel()

    # declare queue
    channel.queue_declare(queue=args.queue)
    
    # callback - fake a second of work for every character in the body
    def callback(ch, method, properties, body):
        print(" ")
        callback.completed = callback.completed + 1 
        print(f" [x] Received {body.decode()}")
        duration = len(body)
        print(f"     Length {duration}")
        time.sleep(duration)        
        if ( args.lose_every > 0 ) and ( ( callback.completed % args.lose_every ) == 0):
            print(" [!] Lost!")
            return
        print(" [x] Done")
        if ( args.acknowledge ):
            ch.basic_ack(delivery_tag = method.delivery_tag) 
    callback.completed = 0
        
    # setup callback to receive messages
    channel.basic_consume(queue=args.queue, on_message_callback=callback, auto_ack= not args.acknowledge)

    # start consuming
    print(' [*] Waiting for messages. To exit press CTRL+C')
    channel.start_consuming()
    
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Interrupted')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
