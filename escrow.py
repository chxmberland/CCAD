#   Author: Benjamin Chamberland
#   Date: 2021-12-16
#
#   Description:
#       
#       This Python file will/does contain the functions necessary to manage data relevant to the
#       backend management of CCAD's accumulation period.



# Importing the necessary libraries
import sqlite3



# This function will add escrow value to a given address.
# This data will be stored on CCAD's backend as an "IOU" to the address.
# Once the accumulation period is over, am event will be fired which commnicates
# with the CCAD smart contract on Ethereum's blockchain, wherein CCAD will be send
# to accounts which have an escrow value.
def addEscrow(address, value):
    
