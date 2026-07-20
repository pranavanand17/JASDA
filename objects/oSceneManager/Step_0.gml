if (!loaded && char_manager != noone)
{
    load_scene(test_scene);
    loaded = true;
}
run_scene_events();