#!/bin/bash
mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static
cp design_app.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.
echo "FROM python" > tempdir/Dockerfile
echo "COPY ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY design_app.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 8080" >> tempdir/Dockerfile
echp "CMD python3 /home/myapp/design_app.py" >> tempdir/Dockerfile

cd tempdir

docker build -t designapp .

docker run -t -d -p 5050:5050 --name appdesignapprunning designapp
docker ps -a