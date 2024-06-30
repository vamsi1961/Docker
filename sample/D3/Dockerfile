FROM ubuntu:latest

RUN apt-get -y update && apt-get install -y

RUN apt-get -y install clang

COPY . /user/src/cpp_test

WORKDIR /user/src/cpp_test

RUN clang++ -o Test main.cpp

CMD [ "./Test" ]