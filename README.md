# intemp

A bash script to execute a command within a temporary work directory.


## Dependencies

Requires: mktemp


## Install

```
git clone https://github.com/karlkfi/intemp
cd intemp
make install
```

or

```
curl -o- https://raw.githubusercontent.com/karlkfi/intemp/v1.0.0/install.sh | bash
```

## Usage

```
intemp.sh <command> [arg1 [arg2...]]
```

Example (install intemp using intemp):

```
$ myfunc(){ git clone https://github.com/karlkfi/intemp . && make install; }
$ intemp.sh -t intemp myfunc
```


## License

Copyright 2015 Karl Isenberg

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.