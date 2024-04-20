# Bag of words model to identify code regressions

### Dataset
Currently, code is being extracted from Codeforces and specific problems sets.

**Here are the contest IDs that are currently in the dataset:**
- 1928

We then filter on submissions from the same user that have the following verdict : TIME_LIMIT_EXCEEDED, MEMORY_LIMIT_EXCEEDED, OK. The reason that we keep the former two is that the code in those submissions is not inherently incorrect, it is performing poorly. 
