#include <thread>

void parallel(auto func,int id,int times) {
    std::thread worker(func, id, times);
    worker.detach();
}