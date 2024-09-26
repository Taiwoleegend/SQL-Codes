--Cleaning Data in SQL Queries

c

-- standartize Date format

select SaleDateConverted, CONVERT(date, SaleDate)
from PortfolioProject..NashvilleHousing

update NashvilleHousing
set SaleDate = CONVERT(date, SaleDate)

alter table NashvilleHousing
add SaleDateConverted Date

update NashvilleHousing
set SaleDateConverted = CONVERT(date, SaleDate)


-- populate property address date

select *
from PortfolioProject..NashvilleHousing
--where PropertyAddress is null
order by ParcelID

select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, isnull(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
	where a.PropertyAddress is null

update a
set PropertyAddress = isnull(a.PropertyAddress,b.PropertyAddress)
from PortfolioProject..NashvilleHousing a
join PortfolioProject..NashvilleHousing b
	on a.ParcelID = b.ParcelID
	and a.[UniqueID ] <> b.[UniqueID ]
	where a.PropertyAddress is null



	--breaking out address into individual columns(adress, city, state)

	select PropertyAddress
from PortfolioProject..NashvilleHousing

select 
SUBSTRING(propertyaddress, 1, CHARINDEX(',',propertyaddress)-1) as Address
, SUBSTRING(propertyaddress, CHARINDEX(',',propertyaddress)+1, len(propertyaddress)) as Address 
from PortfolioProject..NashvilleHousing

alter table NashvilleHousing
add PropertySplitAddress nvarchar(255)

update NashvilleHousing
set PropertySplitAddress = SUBSTRING(propertyaddress, 1, CHARINDEX(',',propertyaddress)-1)

alter table NashvilleHousing
add PropertySplitCity nvarchar(255)

update NashvilleHousing
set PropertySplitCity = SUBSTRING(propertyaddress, CHARINDEX(',',propertyaddress)+1, len(propertyaddress))

select *
from PortfolioProject..NashvilleHousing



select OwnerAddress
from PortfolioProject..NashvilleHousing

select 
parsename(replace(owneraddress, ',', '.') ,3)
,parsename(replace(owneraddress, ',', '.') ,2)
,parsename(replace(owneraddress, ',', '.') ,1)
from PortfolioProject..NashvilleHousing


alter table NashvilleHousing
add ownersplitaddress varchar (255)

update NashvilleHousing
set ownersplitaddress = parsename(replace(owneraddress, ',', '.') ,3)

alter table NashvilleHousing
add ownersplitcity varchar (255)

update NashvilleHousing
set ownersplitcity = parsename(replace(owneraddress, ',', '.') ,2)


alter table NashvilleHousing
add ownersplitstate varchar (255)

update NashvilleHousing
set ownersplitstate = parsename(replace(owneraddress, ',', '.') ,1)



--change Y and N to Yes and No in "sold as Vacant"

select distinct(soldasvacant), count (soldasvacant)
from PortfolioProject..NashvilleHousing
group by SoldAsVacant
order by 2


select soldasvacant
, case when soldasvacant = 'Y' then 'Yes'
	    when soldasvacant = 'N' then 'No'
		else SoldAsVacant
		end
from PortfolioProject..NashvilleHousing

update NashvilleHousing
set SoldAsVacant = case when soldasvacant = 'Y' then 'Yes'
	    when soldasvacant = 'N' then 'No'
		else SoldAsVacant
		end



--remove duplicates

WITH RowNumCTE AS(
select *,
ROW_number()OVER (
partition by  ParcelID,
			 PropertyAddress,
			 SalePrice,
			 SaleDate,
			 LegalReference
			 ORDER BY
			 UniqueID
			 ) row_num

from PortfolioProject..NashvilleHousing
)
select *
from RowNumCTE
where row_num > 1
order by PropertyAddress


--delete unused columns

select *
from PortfolioProject..NashvilleHousing

Alter table PortfolioProject..NashvilleHousing
Drop Column OwnerAddress, TaxDistrict, PropertyAddress


Alter table PortfolioProject..NashvilleHousing
Drop Column saledate






