# Bash Scripts
Home for all my bash scripts


This README file is a manual for the Check_AWS_Databases_In_Every_Region.py script. 

# The Check_AWS_Databases_In_Every_Region.py script is used to check and collect information on each database in every AWS region. 

At the beggining of the script, you can determine the values and parameters it will check. 

**freeStoragePercentageLimit** is used to check each database free storage space in percentages. 
For example: **freeStoragePercentageLimit=30** means you will see alerts on evenry database that has less than 30% free storage space left. 
It will also calculate the remaining free storage percentage and will print that as well:

"- Note, this instance has less than 30% storage left"
"  Storage left - 25%"

Next, we can check if Multi AZ is enabled for each database instance or not by setting the **checkMultiAZ** variable to **"yes"**. If left unset or with any other value, it will be skipped:
**checkMultiAZ = "yes"**
If the instance does not have Multi AZ configured, it will print this meesage:
"- This instance does not have Multi AZ configured"

Next, we are able to check the PSQL Major and minor versions by setting the **checkPsqlMajorVersion** and **checkPsqlMinorVersion** variables to **"yes"**. 
Similarily to Multi AZ. if these are unset or set to anything else than "yes" the tests will be skipped.
We then specify the major and minor versions we are interested in as the following example shows:
**psqlMajorVersion = "12"
psqlMinorVersion = "13.9"**

The results will be printed as such:
"- This instance is running with PostgreSQL Major version 12"
"- This instance is running with PostgreSQL version 13.9"

Lastly, we are also checking if the instance Storage Autoscaling is disabled. 
If it is, a messasge will be printed:
"- Storage Autoscaling is Disabled"

# Example of the script output:
```bash
..................................................................
Check AWS Databases In Every Region
Date: 2023-11-19 12:51:19.349401
..................................................................
**RR == Read Replica**
#  Region       Engine            Version Identity                                                     RR  Class           Multi-AZ Alloc_Str Percentage_Left    Max_Alloc_Str  Str_Retention  Disk_Type
1  eu-central-1 aurora-postgresql 15.3    aws-aurora-stg-jfrog-catalog-euc-1-reader                    No  db.r6g.large    False     1        N/A                None           7              aurora-iopt1

ALERTS:
- This instance does not have Multi AZ configured

- Storage Autoscaling is Disabled

2  eu-central-1 mysql             8.0.33  canary-automation-stg                                        No  db.m6g.large    False     50       83.16498316498317  297            7              gp2

ALERTS:
- This instance does not have Multi AZ configured

3  eu-central-1 mysql             5.7.43  jfrog-stg-rds-encr-store-euc1-master                         No  db.m5.xlarge    False     1000     33.333333333333336 1500           7              gp3

ALERTS:
- This instance does not have Multi AZ configured

4  eu-central-1 mysql             5.7.43  jfrog-stg-rds-encr-store-euc1-read-replica                   No  db.m5.xlarge    True      1000     33.333333333333336 1500           0              gp3

ALERTS:
5  eu-central-1 postgres          13.9    k8s-stg-access-eu-central-1-postgresql                       No  db.m6g.large    False     500      33.333333333333336 750            7              gp3

ALERTS:
- This instance does not have Multi AZ configured

- This instance is running with PostgreSQL version 13.9

6  eu-central-1 postgres          13.9    k8s-stg-ba-billprep-postgresql                               No  db.m6g.large    False     500      33.333333333333336 750            7              gp3

ALERTS:
- This instance does not have Multi AZ configured

- This instance is running with PostgreSQL version 13.9

7  eu-central-1 postgres          13.9    k8s-stg-ba-usage-services-shared-postgresql                  No  db.m6g.large    False     500      33.333333333333336 750            7              gp3

ALERTS:
- This instance does not have Multi AZ configured

- This instance is running with PostgreSQL version 13.9

8  eu-central-1 postgres          12.13   k8s-stg-cloud-usage-eu-central-1-postgresql                  No  db.m6g.large    False     498      33.333333333333336 747            7              gp3

ALERTS:
- This instance does not have Multi AZ configured

- This instance is running with PostgreSQL Major version 12
```
