#!/bin/bash
BEGIN{
flag=0
sum=0
count=0
}
{
if ($1=="Loop") {
flag=0
}
if (flag==1) {
sum=sum+$3
count=count+1
}
if ($1=="Step") {
flag=1
}
}
END{
sum=sum/count
print sum
}