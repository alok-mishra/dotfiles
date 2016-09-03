// VimFx config file
// Change advanced option "extensions.VimFx.config_file_directory" in about:config to "~/.vimfx"
console.log('VimFx Config Loading!', vimfx);

// Clear defaults and indicate it's being handled by config
vimfx.set('mode.normal.scroll_left', '©');
vimfx.set('mode.normal.scroll_right', '©');
vimfx.set('mode.normal.focus_search_bar', '©');

// Set new mappings
vimfx.set('mode.normal.tab_select_previous', 'h');
vimfx.set('mode.normal.tab_select_next', 'l');
vimfx.set('mode.normal.scroll_half_page_down', 'J');
vimfx.set('mode.normal.scroll_half_page_up', 'K');


/***************** CUSTOM COMMANDS *****************/

let {commands} = vimfx.modes.normal;

vimfx.addCommand({
    name: 'kate',
    description: 'Katie!',
}, () => { console.log('Hi Katie!') });
vimfx.set('custom.mode.normal.kate', 'gk');

vimfx.addCommand({
    name: 'append_location_bar',
    description: 'Focuses on the location bar without selection',
    category: 'tabs',
}, (args) => {
    let {vim} = args;
    // commands.tab_new.run(args)
    commands.focus_location_bar.run(args);
    let active = args.vim.window.document.activeElement;
    active.selectionStart = active.selectionEnd;
        console.log('Location Append')
});
vimfx.set('custom.mode.normal.append_location_bar', 'O');
