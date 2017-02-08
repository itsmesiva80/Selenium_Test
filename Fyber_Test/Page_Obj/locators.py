from selenium.webdriver.common.by import By

class MainPageLocators(object):
    """A class for main page locators. All main page locators should come here"""
    GO_BUTTON = (By.ID, 'submit')
    MOVIE_TABLE = (By.XPATH, "//table[@data-caller-name='chart-top250movie']/tbody/tr")
    MOVIE = (By.XPATH, "//table[@data-caller-name='chart-top250movie']/tbody/tr[1]")
    SORT_ICON = (By.XPATH, "//span[starts-with(@class,'global-sprite lister-sort-reverse')]")
    SORT_DROPDOWN = (By.NAME, 'sort')
    TOP_WESTERN = (By.XPATH, "//*[@id='sidebar']/div[6]/span/ul/li[21]/a")
    TOP_WESTERN_MOVIE = (By.XPATH, "//*[@id='main']/div/div/div[3]")
