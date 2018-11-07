
"""From an tab-separated input file containing dates and tracker numbers list sorted resolution dates

    The input file is made from a tracker xml file by an XSLT: ResolutionDates.xsl
"""
import csv


monthAbbrevs = {
                "Jan": "01",
                "Feb": "02",
                "Mar": "03",
                "Apr": "04",
                "May": "05",
                "Jun": "06",
                "Jul": "07",
                "Aug": "08",
                "Sep": "09",
                "Oct": "10",
                "Nov": "11",
                "Dec": "12"
                }

with open("../PhdResDates.txt") as csvfile:
    csvreader = csv.reader(csvfile, delimiter="\t")
    # dated_items accumulates resolutions with the tracker dates converted to iso format
    dated_items = []
    # meeting_dates just lists the distinct dates on which resolutions occurred
    meeting_dates = []
    # accumulate the tracker numbers with no resolution date
    unresolved_trackers = []
    for row in csvreader:
        number = row[0]
        if len(row) > 1 and len(row[1]):
            month, day, year = row[1].split()
            # convert the 3-letter month abbreviation fron the xml file to number
            month = monthAbbrevs[month]
            datestr = "-".join([year, month,day])
            if datestr not in meeting_dates:
                meeting_dates.append(datestr)
            dated_items.append(f"{datestr}\t{number}")
        else:
            datestr = ""
            unresolved_trackers.append(number)


# sort and print the distinct meeting dates
meeting_dates.sort()
for d in meeting_dates:
    print(d)
print()
# sort and print the dates and numbers of resolved trackerskkkkk
dated_items.sort()
for item in dated_items:
    print(item)
unresolved_trackers.sort()
print ()
for item in unresolved_trackers:
    print(item)


