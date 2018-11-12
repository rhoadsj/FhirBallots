"""
given a day of the week, make a list of dates of that day of the week
"""

# from calendar import monthdays2calendar
import calendar

starting_year = 2018
starting_month = 4
number_of_months = 3
year = starting_year
month = starting_month
for i in range(0, number_of_months):
    x = calendar.monthcalendar(year, month)
    for w in range(0, 5):
        weekdays = x[w]
        day_of_month = weekdays[calendar.WEDNESDAY]
        if day_of_month > 0:
            print(f"{year:04d}-{month:02d}-{day_of_month:02d}")
    month += 1
