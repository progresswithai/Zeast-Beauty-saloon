$files = Get-ChildItem "d:\realityfaces\Zeast Beauty saloon\www.altitudesalonllc.com\*.html" -Recurse

foreach ($file in $files) {
    try {
        $content = Get-Content $file.FullName -Raw
        
        # Replace logo URLs (various formats)
        $content = $content -replace "https?://images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/26ad8415-6f10-4efe-80ea-1d9be30e3292/Altitude_logo[^ \t`"]*", "logo.png"
        $content = $content -replace "https?://images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/a86db268-d055-45dc-b502-ac07760ef02b/Altitude_submark[^ \t`"]*", "logo.png"
        $content = $content -replace "\.\./images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/26ad8415-6f10-4efe-80ea-1d9be30e3292/Altitude_logo[^ \t`"]*", "logo.png"
        $content = $content -replace "\.\./images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/a86db268-d055-45dc-b502-ac07760ef02b/Altitude_submark[^ \t`"]*", "logo.png"
        $content = $content -replace "//images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/26ad8415-6f10-4efe-80ea-1d9be30e3292/Altitude_logo[^ \t`"]*", "logo.png"
        $content = $content -replace "//images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/a86db268-d055-45dc-b502-ac07760ef02b/Altitude_submark[^ \t`"]*", "logo.png"
        $content = $content -replace "zest_logo\.png", "logo.png"
        
        # Replace metadata images & social logos
        $content = $content -replace "https?://images\.squarespace-cdn\.com/content/66e34c24d6049d20d04964d1/498293a1-9362-4560-a702-dba1d51fa130/Altitude_submark[^ \t`"]*", "logo.png"
        $content = $content -replace "\.\./images\.squarespace-cdn\.com/content/66e34c24d6049d20d04964d1/498293a1-9362-4560-a702-dba1d51fa130/Altitude_submark[^ \t`"]*", "logo.png"
        $content = $content -replace "//images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/498293a1-9362-4560-a702-dba1d51fa130/Altitude_submark[^ \t`"]*", "logo.png"
        
        # Replace favicon
        $content = $content -replace "https?://images\.squarespace-cdn\.com/content/v1/66e34c24d6049d20d04964d1/27c4cf30-63df-4e62-8d93-0912af544f7c/favicon\.ico[^ \t`"]*", "logo.png"
        
        # Replace Altitude Salon with Zest Beauty Salon in text and alt tags
        $content = $content -replace "Altitude Salon - Lone Tree, CO", "Zest Beauty Salon - Viman Nagar, Pune"
        
        Set-Content $file.FullName $content -Encoding UTF8
    } catch {
        Write-Error "Failed to process $($file.FullName): $($_.Exception.Message)"
    }
}
