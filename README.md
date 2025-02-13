# [ClangSharpPInvokeGenerator](https://github.com/dotnet/ClangSharp#generating-bindings) Container

c Header파일로 c# Wrapper 코드를 만드는데다 가져다 쓸 닷넷도구를 간편히 실행하기 위해 작성한 `패키지-미리깐` 컨테이너 입니다.

## Example

```bash
wget https://github.com/webui-dev/webui/releases/download/2.5.0-beta.2/webui-linux-clang-x64.zip
unzip webui-linux-clang-x64.zip

docker run --rm \
    -v ./webui-linux-clang-x64/include:/sample \
    naratteu/clangsharppinvokegenerator ./ClangSharpPInvokeGenerator -f /sample/webui.h -n webui -o /sample/webui.cs

head ./webui-linux-clang-x64/include/webui.cs # 씨샵코드 생성 체크
```
