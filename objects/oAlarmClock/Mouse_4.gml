if (!clicked)
{
    clicked = true;

    audio_stop_sound(snd_alarm);

    sprite_index = sAlarm_Idle;

    var scene_manager = instance_find(oSceneManager, 0);

    if (scene_manager != noone)
    {
        scene_manager.alarm_clicked = true;
    }
}