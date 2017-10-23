#!/usr/bin/python
  
import json
import datetime

today = datetime.date.today()
custom_facts = json.dumps({"organization": "QA", "date": str(today)})

print custom_facts

