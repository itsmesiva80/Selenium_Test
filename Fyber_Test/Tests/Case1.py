from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import os
from selenium.webdriver.support.ui import Select

#X-path Variables
URL = "http://www.imdb.com/chart/top"
MOVIE_TABLE = "//table[@data-caller-name='chart-top250movie']/tbody/tr"
MOVIE = "//table[@data-caller-name='chart-top250movie']/tbody/tr[1]"
SORT_ICON = "//span[starts-with(@class,'global-sprite lister-sort-reverse')]"
SORT_DROPDOWN = "sort"
TOP_WESTERN = ".//*[@id='sidebar']/div[6]/span/ul/li[21]/a"
TOP_WESTERN_MOVIE = ".//*[@id='main']/div/div/div[3]"

#open imbd on firefox
driver = webdriver.Firefox()
driver.get(URL)
assert "IMDb" in driver.title

#number of rows exist in the table
row_count = len(driver.find_elements_by_xpath(MOVIE_TABLE))
assert 250 , row_count
print row_count

#atlest one movie exist
movie_exist= len(driver.find_elements_by_xpath(MOVIE))
if movie_exist>0 :
    assert 1 , movie_exist
    print movie_exist

#click on sort button -default option
driver.find_element_by_xpath(SORT_ICON).click()
#Verify 250 records exist
assert 250 , row_count
print row_count

#Select each sort option
select = Select(driver.find_element_by_name(SORT_DROPDOWN))
options = select.options
for index in range(0, len(options)):
    select.select_by_index(index)
    #click on sort button-ascending
    driver.find_element_by_xpath(SORT_ICON).click()
    #Verify 250 records exist
    row_count = len(driver.find_elements_by_xpath(MOVIE_TABLE))
    assert 250 , row_count
    print row_count

    #click on sort button-dscending
    driver.find_element_by_xpath(SORT_ICON).click()
    #Verify 250 records exist
    row_count = len(driver.find_elements_by_xpath(MOVIE_TABLE))
    assert 250 , row_count
    print row_count

#click on side bar TOP Genere
driver.find_element_by_xpath(TOP_WESTERN).click()
driver.implicitly_wait(10)
record_count= len(driver.find_elements_by_xpath(TOP_WESTERN_MOVIE))
print record_count

driver.quit()
