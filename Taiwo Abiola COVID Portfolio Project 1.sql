select *
from PortfolioProject..CovidDeaths
where continent is not null
order by 3,4

--select *
--from PortfolioProject..CovidVaccination
--order by 3,4

-- select data that i am going to be using
create view CovidData as
select location, date, total_cases, new_cases, total_deaths, population
from PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

-- looking at total cases vs total deaths
-- shows likelihood of dying if you contract covid in Nigeria
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%nigeria%'
and continent is not null
order by 1,2


--looking at total cases vs population 
-- shows what percentage of population got covid

select location, date,population, total_cases, (total_cases/population)*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
--where location like '%nigeria%'
order by 1,2

--looking at countries with highest infection rate compared to population

select location,population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as PercentPopulationInfected
from PortfolioProject..CovidDeaths
--where location like '%nigeria%'
GROUP BY population, location
order by PercentPopulationInfected desc


-- showing countries with highest death count per population

select location, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%nigeria%'
where continent is not null
GROUP By location
order by TotalDeathCount desc



--breaking things down by continent

select continent, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%nigeria%'
where continent is not null
GROUP By continent
order by TotalDeathCount desc


--showing continents with highest deaths per population

select continent, max(cast(total_deaths as int)) as TotalDeathCount
from PortfolioProject..CovidDeaths
--where location like '%nigeria%'
where continent is not null
GROUP By continent
order by TotalDeathCount desc

--Global numbers

select sum(new_cases) as Total_Cases, sum(cast(new_deaths as int)) as Total_Deaths, sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
--where location like '%nigeria%'
where continent is not null
--group by date
order by 1,2


-- looking at total population vs vaccinations


select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
from PortfolioProject..CovidDeaths dea
join portfolioProject.. CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
	order by 2,3



	select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join portfolioProject.. CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
	order by 2,3



	--Using  CTE

	With PopvsVac (continent, location, date , population, new_vaccinations, RollingPeopleVaccinated)
	as
	(
	select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join portfolioProject.. CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
	)

	select *,( RollingPeopleVaccinated/population)*100
	from PopvsVac







	--temp table

	drop table if exists #PercentPopulatedVaccinated
	create table #PercentPopulatedVaccinated
	(
	continent nvarchar(255),
	location nvarchar(255),
	date datetime,
	population numeric,
	new_vaccinations numeric,
	RollingPeopleVaccinated numeric
	)
	insert into #PercentPopulatedVaccinated
	select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join portfolioProject.. CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null

	select *,(RollingPeopleVaccinated/population)*100
	from #PercentPopulatedVaccinated


		-- creating views to store data for visualization


create view PercentPopulatedVaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join portfolioProject.. CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
	--order by 2,3

	select *
	from percentPopulatedVaccinated



	create view PopvsVac as
	select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
	, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from PortfolioProject..CovidDeaths dea
join portfolioProject.. CovidVaccination vac
	on dea.location = vac.location
	and dea.date = vac.date
	where dea.continent is not null
	--order by 2,3

	select *
	from PopvsVac




	-- looking at total cases vs total deaths
-- shows likelihood of dying if you contract covid in Nigeria
create view NigeriaTotalCaseVsTtoalDeath as
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from PortfolioProject..CovidDeaths
where location like '%nigeria%'
and continent is not null
--order by 1,2


select *
from CovidData