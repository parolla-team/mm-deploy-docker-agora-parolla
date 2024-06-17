CREATE OR REPLACE FUNCTION set_default_theme()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO preferences(userid, category, name, value) 
    VALUES (NEW.id, 'theme', '', '{"sidebarBg":"#f8f7ff","sidebarText":"#090a0b","sidebarUnreadText":"#2d3039","sidebarTextHoverBg":"#ebebed","sidebarTextActiveBorder":"#b8b8ff","sidebarTextActiveColor":"#2d3039","sidebarHeaderBg":"#f5f4f9","sidebarHeaderTextColor":"#2d3039","sidebarTeamBarBg":"#f5f4f9","onlineIndicator":"#3db887","awayIndicator":"#f5ab07","dndIndicator":"#d24b4e","mentionBg":"#9381ff","mentionBj":"#9381ff","mentionColor":"#ffffff","centerChannelBg":"#ffffff","centerChannelColor":"#3f4350","newMessageSeparator":"#ffeedd","linkColor":"#9381ff","buttonBg":"#9381ff","buttonColor":"#ffffff","errorTextColor":"#d24b4e","mentionHighlightBg":"#b8b8ff","mentionHighlightLink":"#F8F7FF","codeTheme":"github"}');
    RETURN NEW;
END; $$ LANGUAGE plpgsql;

-- Create the trigger
CREATE TRIGGER after_user_insert AFTER INSERT ON users FOR EACH ROW EXECUTE FUNCTION set_default_theme();
