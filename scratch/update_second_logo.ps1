$files = Get-ChildItem "d:\realityfaces\Zeast Beauty saloon\www.altitudesalonllc.com\*.html" -Recurse

foreach ($file in $files) {
    try {
        $content = Get-Content $file.FullName -Raw
        
        # Replace body images with second-logo.png
        $content = $content -replace "https?://images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/8ddd1114-5b9b-46c9-a586-9ddf20e6741b/Aveda-Brand-Logo-Black\.jpg[^ \t`"]*", "second-logo.png"
        $content = $content -replace "\.\./images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/8ddd1114-5b9b-46c9-a586-9ddf20e6741b/Aveda-Brand-Logo-Black\.jpg[^ \t`"]*", "second-logo.png"
        
        $content = $content -replace "https?://images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/498293a1-9362-4560-a702-dba1d51fa130/Altitude_submark\.png[^ \t`"]*", "second-logo.png"
        $content = $content -replace "\.\./images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/498293a1-9362-4560-a702-dba1d51fa130/Altitude_submark\.png[^ \t`"]*", "second-logo.png"
        
        # Fix broken srcset from user's manual edit
        $content = $content -replace "https:logo\.png", "second-logo.png"
        
        # Ensure all srcset references within these specific blocks point to second-logo.png
        # (This is a simplified approach, given the pattern of HTTrack/Squarespace imgs)
        
        Set-Content $file.FullName $content -Encoding UTF8
    } catch {
        Write-Error "Failed to process $($file.FullName): $($_.Exception.Message)"
    }
}
