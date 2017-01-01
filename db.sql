CREATE DATABASE pmss;

USE pmss;

CREATE TABLE developments (
    name            VARCHAR(25),
    location        VARCHAR(25),
    vendor          VARCHAR(25),
    agent           VARCHAR(25),
    approved        CHAR(1),
    launchDate      DATE,
    plotNumber      INT,
    legalCompletion CHAR(1)
    );

INSERT INTO developments (name, location, vendor, agent, approved, launchDate, plotNumber, legalCompletion) VALUES('Example House', 'Leeds', 'Midas', 'BPS', 'Y', '17 Jan 2017', 20, 'Y');
INSERT INTO developments (name, location, vendor, agent, approved, launchDate, plotNumber, legalCompletion) VALUES('Little House', 'Manchester', 'Trent', 'BPS', 'Y', '01 Feb 2017', 5, 'Y');
INSERT INTO developments (name, location, vendor, agent, approved, launchDate, plotNumber, legalCompletion) VALUES('Mighty House', 'Sheffield', 'Trent', 'PLL', 'Y', '18 Feb 2017', 9, 'N');
INSERT INTO developments (name, location, vendor, agent, approved, launchDate, plotNumber, legalCompletion) VALUES('Farm House', 'Manchester', 'Midas', 'PLL', 'Y', '29 Mar 2017', 25, 'Y');
INSERT INTO developments (name, location, vendor, agent, approved, launchDate, plotNumber, legalCompletion) VALUES('White House', 'Sheffield', 'Trent', 'BPS', 'Y', '30 Mar 2017', 10, 'N');

DELIMITER //
CREATE PROCEDURE get_developments
()
BEGIN
  SELECT name, location, vendor, agent, approved, launchDate, plotNumber, legalCompletion FROM developments;
END //
DELIMITER ;
