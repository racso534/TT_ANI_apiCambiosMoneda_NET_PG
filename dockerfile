FROM mcr.microsoft.com/dotnet/aspnet/:8.0 as base
WORKDIR /app
ENV ASPNETCORE_URLS=http//+:5235

EXPOSE  5235

FROM mcr.microsoft.com/dotnet/sdk/:8.0 as build
WORKDIR /src
COPY . .
RUN dotnet restore
run dotnet publish -c Release -o /app

ENTRYPOINT [ "dotnet","apiCambiosMoneda.Presentacion.dll"]