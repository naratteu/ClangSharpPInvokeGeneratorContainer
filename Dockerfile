FROM mcr.microsoft.com/dotnet/sdk:8.0-noble

WORKDIR /work

RUN dotnet new console
RUN dotnet add package libclang.runtime.linux-x64
RUN dotnet add package libClangSharp.runtime.linux-x64
RUN dotnet build
RUN dotnet tool install ClangSharpPInvokeGenerator --tool-path .
RUN cp bin/Debug/net*/runtimes/linux-x64/native/*.so .store/clangsharppinvokegenerator/*/clangsharppinvokegenerator/*/tools/net*/any

RUN apt update
RUN apt install -y llvm-18
RUN apt install -y clang-18
ENV CPLUS_INCLUDE_PATH=/usr/lib/llvm-18/lib/clang/18/include/