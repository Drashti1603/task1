import json

def results(json_data):
    pass_cnt = 0
    fail_cnt = 0
    skip_cnt = 0
    for elements in json_data[0].get('elements', []):
        for step in elements.get('steps', []):
            step_status = step.get('result', {}).get('status', '').lower()
            if step_status == 'passed':
                pass_cnt += 1
            elif step_status == 'failed':
                fail_cnt += 1
            elif step_status == 'skipped':
                skip_cnt += 1

    return pass_cnt, fail_cnt, skip_cnt

file_path = 'cucumber.json'

with open(file_path, 'r') as file:
    json_data = json.loads(file.read())
    passed, failed, skipped = results(json_data)
    print("Passed: {0}, Failed:  {1}, Skipped: {2}".format(passed,failed,skipped))
 