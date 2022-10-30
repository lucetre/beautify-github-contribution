# python tools/create_contribution_md.py
import numpy as np
import sys
import datetime

SUNDAY_WEEKDAY = 6
DAYS_IN_A_WEEK = 7

f = open("tools/contribution/graph.txt", "r")
contribution_graph = [line.strip() for line in f.readlines()]

# contribution_graph = '''
# 01010101010101010101010101010101010101010101010101010
# 10101010101010101010101010101010101010101010101010101
# 01010101010101010101010101010101010101010101010101010
# 01010101010101010101010101010101010101010101010101010
# 10101010101010101010101010101010101010101010101010101
# 10101010101010101010101010101010101010101010101010101
# 01010101010101010101010101010101010101010101010101010
# '''.strip().split('\n')

if len(contribution_graph) != DAYS_IN_A_WEEK:
    sys.exit('Length of contribution_graph not matches to DAYS_IN_A_WEEK.')

num_of_weeks = len(contribution_graph[0])
if (np.array([len(week) for week in contribution_graph]) == num_of_weeks).all() != True:
    sys.exit('The num_of_weeks not matches to other neighbor weekdays.')

today = datetime.date.today()
init_date = today + \
    datetime.timedelta((SUNDAY_WEEKDAY-today.weekday()-1) % DAYS_IN_A_WEEK+1)

with open("tools/contribution/deploy.md", "w") as f:
    for i in range(1, num_of_weeks+1):
        start_date = init_date + datetime.timedelta(i*DAYS_IN_A_WEEK)
        end_date = init_date + datetime.timedelta((i+1)*DAYS_IN_A_WEEK-1)
        f.write(
            f'|[{i}] {start_date.strftime("%b %d, %Y")} ~ {end_date.strftime("%b %d, %Y")}')
    f.write('|\n')

    for i in range(1, num_of_weeks+1):
        f.write('|--')
    f.write('|\n')

    for i in range(DAYS_IN_A_WEEK):
        for j in range(num_of_weeks):
            curr_date = init_date + datetime.timedelta(j*DAYS_IN_A_WEEK + i)
            if contribution_graph[i][j] == '0':
                f.write(
                    f'|[:white_circle:](## "{curr_date.strftime("%b %d, %Y")}")')
            if contribution_graph[i][j] == '1':
                f.write(
                    f'|[:green_circle:](## "{curr_date.strftime("%b %d, %Y")}")')
        f.write('|\n')

with open("tools/contribution/preview.md", "w") as f:
    for i in range(DAYS_IN_A_WEEK):
        for j in range(num_of_weeks):
            if contribution_graph[i][j] == '0':
                f.write(':white_circle:')
            if contribution_graph[i][j] == '1':
                f.write(':green_circle:')
        f.write('\n')
