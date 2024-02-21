#!/bin/bash
mysql --user rfamro --host mysql-rfam-public.ebi.ac.uk --port 4497 --database Rfam < script.sql-2 > ./output.sql-2
cat output.sql-2
