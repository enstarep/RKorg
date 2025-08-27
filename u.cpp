#include <pybind11/pybind11.h>
namespace pb = pybind11;
class r {
    private:
        int k = 34;
};

PYBIND11_MODULE(u,m) {
    pb::class_<r>(m, "r")
    .def(pb::init<int>())
    .def_property("k",&r::k,&r::k);
}