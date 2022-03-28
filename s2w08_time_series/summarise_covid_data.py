#!/usr/bin/env python3

import pandas as pd

covid = pd.read_csv('covid.csv')
covid_summary=covid[["Date","ConfirmedCovidCases","ConfirmedCovidDeaths"]]
covid_summary.to_csv('covid_summary.csv',index=False)

