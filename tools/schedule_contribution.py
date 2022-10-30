import os
import datetime
import pickle

# os.environ['CONTRIBUTOR'] = 'lucetre'
CONTRIBUTOR = os.getenv('CONTRIBUTOR')
DAYS_IN_A_WEEK = 7

def update_contribution(curr_date=datetime.datetime.today(), contribute=False):
    DIR = curr_date.strftime("scheduler/%Y/%m/%d")
    FILEPATH = f"{DIR}/CONTRIBUTORS"
    os.path.isdir(DIR) or os.makedirs(DIR)

    if not os.path.isfile(FILEPATH):
        open(FILEPATH, 'a').close()
    
    with open(FILEPATH, "r+") as f:
        lines = f.readlines()
        contributor = f'{CONTRIBUTOR}\n'
        try:
            lines.index(contributor)
            if contribute: return
            lines.remove(contributor)
            f.seek(0)
            f.truncate()
            f.writelines(lines)
        except ValueError:
            if not contribute: return
            f.write(contributor)

if __name__ == "__main__":
    with open("tools/contribution/data.pkl", "rb") as f:
        data = pickle.load(f)

    contribution_graph = data["contribution_graph"]
    init_date = data["init_date"]

    for i in range(DAYS_IN_A_WEEK):
        for j in range(len(contribution_graph[i])):
            curr_date = init_date + datetime.timedelta(i + j*DAYS_IN_A_WEEK)
            if contribution_graph[i][j] == '1':
                update_contribution(curr_date, True)
            else:
                update_contribution(curr_date, False)
            print(contribution_graph[i][j], end='')
        print()