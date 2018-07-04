include "hello_domain.thrift"

namespace java com.dapeng.example.hello.service

/**
* Hello-Service
**/
service HelloService {

/**
# say hello

**/
    string sayHello(1:string name),
/**
# say hello2

**/
    string sayHello2(1:hello_domain.Hello hello)

}(group="hello")