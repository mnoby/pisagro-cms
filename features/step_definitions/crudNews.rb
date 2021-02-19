require	"selenium-webdriver"
require "rubygems"
require "rspec"

driver = Selenium::WebDriver.for:chrome
driver.manage.window.maximize
wait = Selenium::WebDriver::Wait.new(:timeout => 15)


Given('open the website') do
	driver.get('https://pisagro-devel.b2btrace.com/')
	inputUsername = wait.until {
   	element = driver.find_element(:name, "identity")
   	element if element.displayed?
   	}
   	inputUsername.send_keys("sinta.ruch@koltiva.com")

  inputPass = wait.until {
   	element = driver.find_element(:name, "password")
   	element if element.displayed?
   	}
   	inputPass.send_keys("Password1234!")
   	driver.find_element(:id, "btnSubmit").click
end


# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Then('user access cms news menu') do
	menu = wait.until {
	element = driver.find_element(:xpath => "//*[@id='ext-gen1018']/div[2]/div[1]/div/ul/li[4]/a/span")
   	element if element.enabled? 
   	}
    menu.click
	# menu.find_element(:xpath =>"//div[@class='content']/ul/child::li[4]/ul/child::li[2]/div/div[1]/ul/child::li[1]/a").click
	# menu.action.move_to(driver.find_element(:xpath => "//div[@class='content']/ul/child::li[4]")).perform
	# el = driver.find_element(:xpath =>"//div[@class='content']/ul/child::li[4]")
	# driver.action.move_to(el).perform

	menu1 = wait.until {
	element1 =  driver.find_element(:xpath =>"//*[@id='ext-gen1018']/div[2]/div[1]/div/ul/li[4]/ul/li[2]/div/div[1]/ul/li[1]/a")
	element1 if element1.enabled?
	}
	menu1.click
	
  end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Then('user create news') do
  clickPublish=wait.until{
    el = driver.find_element(:xpath,"//*[@id='temp-1']/div/div[2]/div[5]/button")
    el if el.displayed?
  }
  clickPublish.click

  addNew=wait.until{
    el = driver.find_element(:xpath,"//*[@id='addNew']/i")
    el if el.enabled?
  }
  addNew.click

  # Pilih Bahasa
  clickLang = wait.until{
    el = driver.find_element(:xpath,"//*[@id='News-Form']/div[1]/div[1]/div/div[2]/div/div[2]/div/span/span[1]/span/span[2]/b")
    el if el.displayed?
  }
  clickLang.click
  # Cari Bahasa
  lang=driver.find_element(:xpath,"//*[@id='ext-gen1018']/span/span/span[1]/input")
  lang.send_keys("engl")
  lang.send_keys:return

  # Masukkan Judul Berita
  driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[2]/div/div/div[1]/input[3]").send_keys("News 31")
  # Simpan data kedalam vatiabel
  @storeTitle = driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[2]/div/div/div[1]/input[3]").attribute('value')


    # summary
  driver.find_element(:xpath,"//*[@id='News-Form']/div[1]/div[2]/div/div/div[2]/textarea[2]").send_keys("Lorem Ipsum")
  @storeSumm = driver.find_element(:xpath,"//*[@id='News-Form']/div[1]/div[2]/div/div/div[2]/textarea[2]").attribute('value')
  
  # upload image
  driver.find_element(:xpath,"//*[@id='files']").send_keys("C:\\Users\\NOBY-KOLTIVA\\Desktop\\Contact-28b1e997c0b3fef6f824152878ff99941583895471.png")
  
  # deskripsi
  driver.find_element(:xpath,"//*[@id='editor-en']/div/div[3]/div[3]/p").send_keys("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
  @storeDesc = driver.find_element(:xpath,"//*[@id='editor-en']/div/div[3]/div[3]/p").text


  # SCROLL KEATAS SUPAYA ELEMENT DROPDOWN BAHAsa TERLIHAT
  driver.execute_script "window.scrollTo(0, -document.body.scrollHeight)"

  # GANTI KE BAHASA INDO  
  driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[1]/div/div[2]/div/div[2]/div/span/span[1]/span/span[2]/b").click
  lang2=driver.find_element(:xpath,"//*[@id='ext-gen1018']/span/span/span[1]/input")
  lang2.send_keys("bahas")
  lang2.send_keys:return
  sleep 2

   # Masukkan Judul Berita Indo
  driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[2]/div/div/div[1]/input[2]").send_keys("Berita 31")
  @storeTitleID = driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[2]/div/div/div[1]/input[2]").attribute('value')
    
    # summary
  driver.find_element(:xpath,"//*[@id='News-Form']/div[1]/div[2]/div/div/div[2]/textarea[1]").send_keys("Mari Kita Coba")
  @storeSummID = driver.find_element(:xpath,"//*[@id='News-Form']/div[1]/div[2]/div/div/div[2]/textarea[1]").attribute('value')
  
  # deskripsi
  driver.find_element(:xpath,"//*[@id='editor-id']/div/div[3]/div[3]/p").send_keys("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
  @storeDescID = driver.find_element(:xpath,"//*[@id='editor-id']/div/div[3]/div[3]/p").text

  # Access Handler (Dropdown)
  driver.find_element(:xpath, "//*[@id='News-Form']/div[2]/div[2]/div[1]/span/span[1]/span/span[2]/b").click
  

  # Mencari kata Private
  typeAccess=driver.find_element(:xpath, "//*[@id='ext-gen1018']/span/span/span[1]/input")
  typeAccess.send_keys('Private')
  typeAccess.send_keys:return
  @storeAccHandler =  driver.find_element(:xpath, "//*[@id='select2-news-status-container']").attribute('title')

  typeMember=driver.find_element(:xpath,"//*[@id='News-Form']/div[2]/div[2]/div[2]/span/span[1]/span/ul/li/input")
  typeMember.send_keys('Observer')
  typeMember.send_keys:return
  

  # Upload Attachment
  driver.find_element(:xpath,"//*[@id='upload_file1']").send_keys("C:\\Users\\NOBY-KOLTIVA\\Desktop\\Contact-28b1e997c0b3fef6f824152878ff99941583895471.png")
  
  # Masukkan Tag
  typeTag=driver.find_element(:xpath,"//*[@id='tags-field']")
  typeTag.send_keys("news")
  typeTag.send_keys:return

  # SCROLL KEATSD
  driver.execute_script "window.scrollTo(0, -document.body.scrollHeight)"

  # Simpan
  driver.find_element(:xpath,"//*[@id='News-Form']/div[2]/div[1]/div/button[2]/span[1]").click
  driver.find_element(:xpath, "//*[@id='savePublish']").click

   sleep 5
end

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Then('user check inputted news') do
  wait.until{
    el = driver.find_element(:id,"breadcrumb_title")
    el if el.displayed?
  }


  driver.find_element(:xpath,"//*[@id='wrapper']/div/div/div[1]/div[1]/div/div[2]/div/div[2]/div/span/span[1]/span/span[2]/b").click
  # Cari Bahasa
  lang=driver.find_element(:xpath,"//*[@id='ext-gen1018']/span/span/span[1]/input")
  lang.send_keys("engl")
  lang.send_keys:return

  sleep 1

  # KLIK BUTTON UPDATE SESUAI DENGSN ID NEWS-NYA
  driver.find_element(:xpath,"//*[@id='temp-1']/div/div[2]/div[5]/a[contains(@onclick,'news_id=53&proccess=update')]").click

  # pengecekan field2 yang telah di input
  title=wait.until{
    el=driver.find_element(:xpath,"//*[@id='News-Form']/div[1]/div[2]/div/div/div[1]/input[3]")
    el if el.displayed?
  }

  # inisialisasi field
  titleIndo     = driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[2]/div/div/div[1]/input[2]")
  summary       = driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[2]/div/div/div[2]/textarea[2]")
  summaryIndo   = driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[2]/div/div/div[2]/textarea[1]")
  image         = driver.find_element(:xpath, "//*[@id='PhotoBox']/img")
  deskripsi     = driver.find_element(:xpath, "//*[@id='editor-en']/div/div[3]/div[3]/p")
  deskripsiIndo = driver.find_element(:xpath, "//*[@id='editor-id']/div/div[3]/div[3]/p")
  accessHandler = driver.find_element(:xpath, "//*[@id='select2-news-status-container']")
  membership    = driver.find_element(:xpath, "//*[@id='News-Form']/div[2]/div[2]/div[2]/span/span[1]/span/ul/li[1]")
  attach        = driver.find_element(:xpath, "//*[@id='delete_file2']/div/div[1]/div/a")
  tag           = driver.find_element(:xpath, "//*[@id='tagsInput-form']/li[2]/input")

  # Pemanggilan variabel dan dilakukak pengecekan dengan fungsi IF
if title.attribute('value') == @storeTitle
  print "Test Passed : Field Title berisikan nilai = '" +title.attribute('value') 
  print"' \n"
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print" \n"
end

if summary.attribute('value') == @storeSumm
  print "Test Passed : Field Summary berisikan nilai = '" +summary.attribute('value')
  print" \n" 
else
   print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print"\n"
end

if !image.attribute('src').nil?  
  print "Test Passed : Field Main Image berisikan URL = '" +image.attribute('src')
  print"' \n"
else
  print "Test Not Passed ! Image tidak Tampil ! "
  print" \n"
end

if deskripsi.text == @storeDesc
  print "Test Passed : Field Deskripsi berisikan nilai = '" +deskripsi.text
  print"' \n" 
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print"\n"
end

if accessHandler.attribute('title') == @storeAccHandler
  print "Test Passed : Field Status Type berisikan nilai = '" +accessHandler.attribute('title')
  print"' \n"
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print" \n"
end


if membership.attribute('title') == "Observer"
  print "Test Passed : Field Membership Access berisikan nilai = '" +membership.attribute('title')
  print"' \n"
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print" \n"
end


if attach.attribute('href')  != ""
  print "Test Passed : Field Attachments berisikan nilai = '" +attach.attribute('href')
  print"' \n"
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print" \n"
end

if tag.attribute('value') == "news"
  print "Test Passed : Field Tag berisikan nilai = '" +tag.attribute('value')
  print"' \n"
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print" \n"
end

  # GANTI CEK BAHASA INDONESIA
driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[1]/div/div[2]/div/div[2]/div/span/span[1]/span/span[2]/b").click
lang3=driver.find_element(:xpath,"//*[@id='ext-gen1018']/span/span/span[1]/input")
lang3.send_keys("engl")
lang3.send_keys:return

driver.find_element(:xpath, "//*[@id='News-Form']/div[1]/div[1]/div/div[2]/div/div[2]/div/span/span[1]/span/span[2]/b").click
lang4=driver.find_element(:xpath, "//*[@id='ext-gen1018']/span/span/span[1]/input")
lang4.send_keys("bahas")
lang4.send_keys:return

sleep 5

if titleIndo.attribute('value') == @storeTitleID
print "Test Passed : Field Title Indonesia berisikan nilai = '" +titleIndo.attribute('value') 
  print"' \n"
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print" \n"
end

if summaryIndo.attribute('value') == @storeSummID
  print "Test Passed : Field Summary Indonesia berisikan nilai = '" +summaryIndo.attribute('value') 
  print"' \n"
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print" \n"
end

if deskripsiIndo.text == @storeDescID 
  print "Test Passed : Field Deskripsi berisikan nilai = '" +deskripsiIndo.text
  print"' \n"
else
  print "Test Not Passed ! Data Yang tampil tidak sesuai dengan data yang di input ! "
  print"\n"
end

sleep 3

driver.find_element(:id,"backLink").click

end 

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


Then('user closing the browser') do
  driver.quit	
end