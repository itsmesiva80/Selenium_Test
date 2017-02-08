from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import os
from selenium.webdriver.support.ui import Select
import unittest
import Page
from locators import MainPageLocators

class Fyber_Test(unittest.TestCase):
    """A sample test class to show how page object works"""

    # Variables
    URL = "http://www.imdb.com/chart/top"

    def setUp(self):
        self.driver = webdriver.Firefox()
        self.driver.get("http://www.imdb.com/chart/top")

    #open imbd on firefox
    def test_case1(self):
        main_page = Page.BasePage(self.driver)
        #assert "IMDb" in main_page.title
        assert main_page.is_title_matches(),"IMDb"
        #number of rows exist in the table
        table_row_count = self.driver.find_element(*MainPageLocators.MOVIE_TABLE)
        assert 250 , table_row_count.len()
        #atlest one movie exist
        movie_exist= self.driver.find_element(*MainPageLocators.MOVIE)
        if movie_exist :
            assert "TRUE" , movie_exist

        #click on sort button -default option
        sort_icon = self.driver.find_element(*MainPageLocators.SORT_ICON)
        sort_icon.click()
        #number of rows exist in the table
        table_row_count = self.driver.find_element(*MainPageLocators.MOVIE_TABLE)
        assert 250 , table_row_count.len()

        #Select each sort option
        sort_dropdown = self.driver.find_element(*MainPageLocators.SORT_DROPDOWN)
        sort_select = Select(sort_dropdown)
        options = sort_select.options
        print sort_select
        self.driver.implicitly_wait(10)
        for index in range(0, len(options)):
            Select(sort_dropdown).select_by_index(index)
            #click on sort button-ascending
            sort_icon = self.driver.find_element(*MainPageLocators.SORT_ICON)
            sort_icon.click()
            #Verify 250 records exist
            table_row_count = self.driver.find_element(*MainPageLocators.MOVIE_TABLE)
            assert 250 , table_row_count.len()

            #click on sort button-dscending
            sort_icon = self.driver.find_element(*MainPageLocators.SORT_ICON)
            sort_icon.click()
            #Verify 250 records exist
            table_row_count = self.driver.find_element(*MainPageLocators.MOVIE_TABLE)
            assert 250 , table_row_count.len()

        #click on side bar TOP Genere
        top_western = self.driver.find_element(*MainPageLocators.TOP_WESTERN)
        top_western.click()
        self.driver.implicitly_wait(10)
        top_movie_exist= self.driver.find_element(*MainPageLocators.TOP_WESTERN_MOVIE)
        if top_movie_exist:
            assert "TRUE", top_movie_exist
        #close browser
        self.driver.implicitly_wait(10)
        self.driver.close()
                
if __name__ == "__main__":
    unittest.main()
