# [ClangSharpPInvokeGenerator](https://github.com/dotnet/ClangSharp#generating-bindings) Container

c Header파일로 c# Wrapper 코드를 만드는데다 가져다 쓸 닷넷도구를 간편히 실행하기 위해 작성한 `패키지-미리깐` 컨테이너 입니다.

## Example

```cmd
curl -L https://github.com/webui-dev/webui/releases/download/2.5.0-beta.2/webui-windows-msvc-x64.zip | tar -x

docker run --rm -v .\webui-windows-msvc-x64\include:/sample naratteu/clangsharppinvokegenerator -f /sample/webui.hpp -t /sample/webui.h -n webui -o /sample/webui.cs --libraryPath ..\\..\\..\\webui-windows-msvc-x64\\webui-2.dll --remap "const char *=string"

dotnet new console
echo using static webui.Methods;webui_show(webui_new_window(), "<html><script src=\"webui.js\"></script> Hello World from C#! </html>");webui_wait();class NativeTypeName(string name) : Attribute; > Program.cs
dotnet run /p:AllowUnsafeBlocks=true
```
