BEGIN{
flag=0
sum=0
count=0
rez=0}
{
if ($1=="Loop"){
        flag=0
}
if (flag==1) {
        count=count+1
        sum=sum+$2
}
if ($1=="Step"){
        flag=1
}
}
END{
rez=sum/count
print rez
}
