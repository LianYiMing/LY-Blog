function isPackageInstalled(packageName)
	packageManager=activity.getPackageManager()
	
	packageInfoList=packageManager.getInstalledPackages(0)
	for num=0,packageInfoList.size()-1 do
		info=packageInfoList.get(num)
		if info.packageName==packageName then
			return true
		end
	end
	return false
end