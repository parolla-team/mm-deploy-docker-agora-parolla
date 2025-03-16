CREATE OR REPLACE FUNCTION set_default_theme()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO preferences(userid, category, name, value) 
    VALUES (NEW.id, 'theme', '', '{"awayIndicator":"#f5ab07","buttonBg":"#9381ff","buttonColor":"#ffffff","centerChannelBg":"#ffffff","centerChannelColor":"#3f4350","codeTheme":"github","dndIndicator":"#d24b4e","errorTextColor":"#d24b4e","linkColor":"#9381ff","mentionBg":"#9381ff","mentionBj":"#9381ff","mentionColor":"#ffffff","mentionHighlightBg":"#9381ff","mentionHighlightLink":"#ffd8be","newMessageSeparator":"#ffd8be","onlineIndicator":"#3db887","sidebarBg":"#f8f7ff","sidebarHeaderBg":"#f5f4f9","sidebarHeaderTextColor":"#2d3039","sidebarTeamBarBg":"#f5f4f9","sidebarText":"#090a0b","sidebarTextActiveBorder":"#b8b8ff","sidebarTextActiveColor":"#2d3039","sidebarTextHoverBg":"#ebebed","sidebarUnreadText":"#2d3039"}');
    RETURN NEW;
END; $$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER after_user_insert AFTER INSERT ON users FOR EACH ROW EXECUTE FUNCTION set_default_theme();
