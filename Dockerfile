FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["InfinionDevOps.csproj", "."]
RUN dotnet restore "InfinionDevOps.csproj"
COPY . .
RUN dotnet build "InfinionDevOps.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "InfinionDevOps.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

RUN adduser --disabled-password --home /app --gecos '' appuser && chown -R appuser /app
USER appuser

ENTRYPOINT ["dotnet", "InfinionDevOps.dll"]