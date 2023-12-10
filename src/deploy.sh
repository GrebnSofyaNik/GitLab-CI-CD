#!/bin/bash

scp -o stricthostkeychecking=no /home/student/builds/1rismLe7/0/students/DO6_CICD.ID_356283/flatulek_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat student@10.10.0.2:/usr/local/bin/
scp -o stricthostkeychecking=no /home/student/builds/1rismLe7/0/students/DO6_CICD.ID_356283/flatulek_student.21_school.ru/DO6_CICD-1/src/grep/s21_grep student@10.10.0.2:/usr/local/bin/
ssh student@10.10.0.2 ls /usr/local/bin
