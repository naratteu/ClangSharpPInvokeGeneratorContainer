FROM mcr.microsoft.com/dotnet/sdk:8.0-noble AS build
WORKDIR /work

RUN dotnet new console
RUN dotnet add package libclang.runtime.linux-x64
RUN dotnet add package libClangSharp.runtime.linux-x64
RUN dotnet build
RUN dotnet tool install ClangSharpPInvokeGenerator --tool-path /tools
RUN cp bin/Debug/net*/runtimes/linux-x64/native/*.so /tools/.store/clangsharppinvokegenerator/*/clangsharppinvokegenerator/*/tools/net*/any

FROM mcr.microsoft.com/dotnet/runtime:8.0-noble
COPY --from=build /tools /tools
ENV PATH="/tools:${PATH}"

RUN apt update
RUN apt install -y llvm-18 clang-18 && rm -rf /var/lib/apt/lists/*
ENV CPLUS_INCLUDE_PATH=/usr/lib/llvm-18/lib/clang/18/include/
ENTRYPOINT ["ClangSharpPInvokeGenerator"]