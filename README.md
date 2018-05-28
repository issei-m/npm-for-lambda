# npm-for-lambda

Installs/Builds node native modules for AWS lambda.

## Usage

1. Clone this repository and change current directory to it
2. Build Docker image

```
$ docker build -t npm-for-lambda .
```

3. Now you can get native node module using NPM on the built image, wherever you are: 

For instance, the way to get `iconv` module is like:

```
$ cd /tmp
$ docker run -it --rm -v /tmp:/root npm-for-lambda install iconv

> iconv@2.3.0 install /root/node_modules/iconv
> node-gyp rebuild

make: Entering directory `/root/node_modules/iconv/build'
  CXX(target) Release/obj.target/iconv/src/binding.o
  CC(target) Release/obj.target/iconv/deps/libiconv/lib/iconv.o
  CC(target) Release/obj.target/iconv/support/localcharset.o
  SOLINK_MODULE(target) Release/obj.target/iconv.node
  COPY Release/iconv.node
make: Leaving directory `/root/node_modules/iconv/build'
npm WARN saveError ENOENT: no such file or directory, open '/root/package.json'
npm notice created a lockfile as package-lock.json. You should commit this file.
npm WARN enoent ENOENT: no such file or directory, open '/root/package.json'
npm WARN root No description
npm WARN root No repository field.
npm WARN root No README data
npm WARN root No license field.

+ iconv@2.3.0
added 2 packages in 9.646s
```

Then, you can retrieve built artifacts from `/tmp/node_modules/iconv` somewhere.
