#!/usr/bin/env python3

import pandas as pd

covid = pd.read_csv('covid.csv')
covid=covid[["Date","ConfirmedCovidCases"]]
covid.to_csv('covid_summary.csv',index=False)

