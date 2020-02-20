-- +--------------------------------------------------------------------+
-- | CiviCRM version 5                                                  |
-- +--------------------------------------------------------------------+
-- | Copyright CiviCRM LLC (c) 2004-2019                                |
-- +--------------------------------------------------------------------+
-- | This file is a part of CiviCRM.                                    |
-- |                                                                    |
-- | CiviCRM is free software; you can copy, modify, and distribute it  |
-- | under the terms of the GNU Affero General Public License           |
-- | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
-- |                                                                    |
-- | CiviCRM is distributed in the hope that it will be useful, but     |
-- | WITHOUT ANY WARRANTY; without even the implied warranty of         |
-- | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
-- | See the GNU Affero General Public License for more details.        |
-- |                                                                    |
-- | You should have received a copy of the GNU Affero General Public   |
-- | License and the CiviCRM Licensing Exception along                  |
-- | with this program; if not, contact CiviCRM LLC                     |
-- | at info[AT]civicrm[DOT]org. If you have questions about the        |
-- | GNU Affero General Public License or the licensing of CiviCRM,     |
-- | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
-- +--------------------------------------------------------------------+
--
-- Generated from schema.tpl
-- DO NOT EDIT.  Generated by CRM_Core_CodeGen
--


-- +--------------------------------------------------------------------+
-- | CiviCRM version 5                                                  |
-- +--------------------------------------------------------------------+
-- | Copyright CiviCRM LLC (c) 2004-2019                                |
-- +--------------------------------------------------------------------+
-- | This file is a part of CiviCRM.                                    |
-- |                                                                    |
-- | CiviCRM is free software; you can copy, modify, and distribute it  |
-- | under the terms of the GNU Affero General Public License           |
-- | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
-- |                                                                    |
-- | CiviCRM is distributed in the hope that it will be useful, but     |
-- | WITHOUT ANY WARRANTY; without even the implied warranty of         |
-- | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
-- | See the GNU Affero General Public License for more details.        |
-- |                                                                    |
-- | You should have received a copy of the GNU Affero General Public   |
-- | License and the CiviCRM Licensing Exception along                  |
-- | with this program; if not, contact CiviCRM LLC                     |
-- | at info[AT]civicrm[DOT]org. If you have questions about the        |
-- | GNU Affero General Public License or the licensing of CiviCRM,     |
-- | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
-- +--------------------------------------------------------------------+
--
-- Generated from drop.tpl
-- DO NOT EDIT.  Generated by CRM_Core_CodeGen
--
-- /*******************************************************
-- *
-- * Clean up the exisiting tables
-- *
-- *******************************************************/

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `civicrm_option_value_ch`;

SET FOREIGN_KEY_CHECKS=1;
-- /*******************************************************
-- *
-- * Create new tables
-- *
-- *******************************************************/

-- /*******************************************************
-- *
-- * civicrm_option_value_ch
-- *
-- * FIXME
-- *
-- *******************************************************/
CREATE TABLE `civicrm_option_value_ch` (


     `id` int unsigned NOT NULL AUTO_INCREMENT  COMMENT 'Unique OptionValueCH ID',
     `option_group_id` int unsigned    COMMENT 'FK to Option Group',
     `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Unique key with option group of the CH Fund in civicrm_option_value table. Is the imported ID from CH',
     `financial_type_id` int unsigned    COMMENT 'Foreign key to civicrm_financial_type',
     `is_enabled_in_ch` tinyint   DEFAULT 0
,
        PRIMARY KEY (`id`),
        UNIQUE KEY `UI_fund_ch_fund` (`financial_type_id`,`value`),
        KEY `index_option_group_id_value` (`value`(128),`option_group_id`),
        KEY `FK_civicrm_option_value_option_group_id` (`option_group_id`),
        CONSTRAINT FK_civicrm_option_value_ch_option_group_id FOREIGN KEY (`option_group_id`) REFERENCES `civicrm_option_group`(`id`) ON DELETE CASCADE,
        CONSTRAINT FK_civicrm_option_value_ch_financial_type_id FOREIGN KEY (`financial_type_id`) REFERENCES `civicrm_financial_type`(`id`) ON DELETE CASCADE
)    ;

CREATE TABLE IF NOT EXISTS `civicrm_ch_contribution_batch` (
   `id` INT NOT NULL AUTO_INCREMENT ,
   `ch_fund` varchar(255) COLLATE utf8_unicode_ci NOT NULL ,
   `fund` INT(11) NOT NULL ,
   `contribution_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;
