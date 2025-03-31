NAME=naratteu/clangsharppinvokegenerator
DATE=20250331 # $(date +%Y%m%d)
docker build . -t $NAME:latest -t $NAME:$DATE
docker push -a $NAME

# todo : 동적 태그 적용? 깃헙액션연동?