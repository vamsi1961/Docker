FROM gcc:latest

COPY . /user/src/cpp_test

WORKDIR /user/src/cpp_test

RUN g++ -o Test main.cpp

CMD [ "./Test" ]