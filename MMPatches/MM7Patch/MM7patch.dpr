library MM7patch;

uses
  SysUtils,
  Classes,
  RSSysUtils,
  Windows,
  RSQ,
  Hooks in 'Hooks.pas',
  Common in 'Common.pas',
  MP3 in 'MP3.pas',
  DXProxy in '..\mmcommon\DXProxy.pas',
  MMCommon in '..\mmcommon\MMCommon.pas',
  D3DHooks in '..\mmcommon\D3DHooks.pas',
  MMHooks in '..\mmcommon\MMHooks.pas',
  LayoutSupport in '..\mmcommon\LayoutSupport.pas',
  MMLayout in '..\mmcommon\MMLayout.pas';

{$R *.res}

{
Version 1.0:
[+] 2 Quick Saves
[+] NoDeathMovie option
[+] NoIntro option disables logo movies and moves the intro to new game start
[+] CapsLockToggleAlwaysRun may be disabled
[+] Smart NoCD
[+] Loads all .dll files from ExeMods directory
[+] Extracted files from events.lod are loaded from DataFiles folder. So, you don't need to insert files into events.lod each time you modify them. 
[+] InventoryKey
[+] ToggleCharacterScreenKey
[+] FreeTabInInventory
[+] Recovery Time info
[+] Harden Item on artifacts, potions don't disappear
[+] NoVideoDelays
[+] PlayMP3
[-] Mok's patch bug: there were gliches of smack animation in houses and even crashes sometimes
[-] Town Portal pauses the game now
[-] Now you can have gaps between save slots. Save and Load would target the same slot anyway
[-] Walk Sound disappearing problem fixed
[-] No need to set compatibility on Win XP anymore
[-] You could drink from fauntains multiple times if all party members are inactive
[-] You could attack with inactive party members

Version 1.0.1:
[-] Fixed my bug which made the game run at huge speed

Version 1.1:
[+] Multiple quicksaves, reworked quicksave
[+] F2 toggles Double Speed mode. DoubleSpeedKey option controls the key.
[+] TurnSpeedNormal and TurnSpeedDouble options control speed of smooth turning. Default is 100% for normal speed and 120% for double speed.
[+] ReputationNumber shows numerial reputation value together with category name
[+] MusicLoopCount option controls loop count of music tracks. Set it to 0 for infinite loop.
[+] HorsemanSpeakTime and BoatmanSpeakTime options control time needed for horseman or boatman to say "Let's go" before new map starts loading.
[+] Improved errors reporting
[-] Inactive characters could use scrolls.
[-] Items bonuses to weapon skills were ignored in recovery time calculation (Ania Selving is the only such item)
[-] Protection from Magic didn't protect from Poison.
[-] 'of Feather Faling' enchantment didn't work (and Hermes' Sandals too).
[-] Dagger in second hand used to do triple damage even on Expert level.
[-] Daggers had 10% chance to do triple damage no matter what Dagger skill you have. ProgressiveDaggerTrippleDamage option makes daggers do triple damage with probability equal to skill. Default is 1 (enabled).
[-] Haste didn't work when some members are dead and weak at the same time.
[-] Buggy autosave file name localization removed
[-] In previous version I accidentally included my altered MONSTERS.txt file. With it female peasants were running at a huge speed and monsters were harder.

Version 1.2:
[+] BlasterRecovery option controls minimal blasdter recovery time. Default is 5. Game default was 0.
[-] Return button in game menu didn't work correctly.
[-] Now Recovery Rate shown by the patch reflects absense of speed limit for laser
[-] Now items that didn't fit into a chest appear in it when you free space for them and reopen the chest (FixChests option)
[-] (not fixed) Some people experienced a crash in load screen in previous version due to long quicksaves names.

Version 1.2.1:
[-] Removed quicksave/autosave names length limit. In Russian version of the patch the limit was exceeded which was leading to a crash.

Version 1.3:
[+] DataFiles lookup can now be disabled (DataFiles option)
[+] Any hooks can be disabled now
[-] DirectDraw errors are now ignored

Version 1.4:
[+] Colored monsters in D3D
[+] Monster contours are taken into account in Direct3D when you click on them.
[+] Textures from LOD in D3D
[+] Removed limit on sprites count
[+] Use Delphi memory manager
[+] Correct door state switching: param = 3
[-] Attacking big monsters D3D
[-] Lich jars quest bug
[-] Credits speed
[-] Party generation screen animation speed
[-] Fix facet ray interception checking out-of-bounds
[-] Fix global.txt, spells.txt, history.txt parsing out-of-bounds
[-] Ignore 'Invalid ID reached!'
[-] Code left from MM6

Version 1.5:
[+] Mouse look
[+] AlwaysStrafe option
[-] My bug: an empty Saves directory was leading to crash
[-] Fix keys configuration loading

Version 1.5.1:
[-] Fix keys configuration loading (last fix was incomplete)

Version 1.6:
[+] MouseLookFly
[+] MouseWheelFly
[+] Mouse look update: MouseLookChangeKey, MouseLookTempKey, MouseLookUseAltMode...
[+] Custom cursor for mouse look mode
[+] Identify Monster shows monster resistances now
[+] Control palette gamma
[+] Now Turn Delta is set to Smooth by default
[+] When run in 32 bits mode automatically switches to 16 bit when Windowed mode is used
[+] Quick load
[+] Autorun
[-] Fixed strafes and walking
[-] negative/0 causes a crash in stats screen
[-] Fix keys configuration loading (last fix didn't work)
[-] Waiting used to recover characters twice as fast
[-] Autosave before taking money for transport, not after
[-] Key strokes could be ignored if some other programs run at the same time (and call GetAsyncKeyState)
[-] In mouse look mode mouse could leave window when moved fast
[-] Lloyd: take spell points and action after autosave, not before
[-] TP: take action after autosave, not before
[-] Town Portal triggered autosave even within a location

Version 1.6.1:
[-] My bug: quicksave set to F11 didn't work in 1.6

Version 1.6.2:
[-] Spear skill wasn't added to damage on expert level (only on master)
[-] My bug: Dead monsters could sometimes move in version 1.6

Version 2.0:
[+] Custom LODs
[+] MLookStartTime
[+] Auto strafe in MouseLook (+StandardStrafe invisible option)
[+] FixInactivePlayersActing option controls corresponding fix
[+] HDWTRCount and HDWTRDelay options control number of water frames (up to 15) and delay between them in D3D
[+] Improved D3D water frames included
[-] Save game failure on some systems
[-] *.dlv and *.ddm 
[-] Unnecessary debug info was written to ErrorLog.txt
[-] MouseLookUseAltMode wasn't supported
[-] "`" or "i" written in MMExtension console were causing character screen to open
[-] Same thing with mouse movement when mouse look is on
[-] Correctly fixed movement rounding problems, including jumps
[-] The door of a shop on an island in Tatalia didn't react to mouse clicks 

Version 2.1:
(MM6 - MM8)
[+] SupportTrueColor, HD in D3D, RenderMaxWidth, RenderMaxHeight, ScalingParam1, ScalingParam2
[+] WindowWidth, WindowHeight
[+] BorderlessWindowed
[+] CompatibleMovieRender, SmoothMovieScaling
[+] Custom .snd and .vid archives
[+] TurnBasedSpeed
[+] MouseLookRememberTime
[+] MouseLookWhileRightClick
[+] PlayMP3 option now supports WAV files
[+] Black potion isn't wasted if it has no effect
[+] Infinite view distance in dungeons
[+] FixInfiniteScrolls option controls corresponding fix
[+] Another approach to fixing chests: now chest contents are reordered to make most valuable items be put into chest first. This can be disabled by setting FixChestsByReorder=0
[*] Some options made 'hidden' to reduce INI clutter.
[-] My bug: *.evt and *.str weren't loaded correctly from DataFiles.
[-] Fix problems with timers: immediate re-trigger in MM6, getting reset by entering location too early (FixTimers hidden option)
[-] Monsters are unlikely to jump from a bridge into lava now. Hidden "MonsterJumpDownLimit" controls the height from which they won't jump (500 by default)
[-] Jumping nerfed a bit, because the party started jumping too high after movement rounding fix. Also, "FixMovement=0" hidden option added that returns vanilla movement.
[-] Blasters and some spells couldn't target rats
[-] Crash with sprites with scale too small (happens with MM6HD)
[-] Town Portal wasting player's turn even if you cancel the dialog
[-] Evt commands couldn't operate on some skills
[-] Crash on exit
(MM6, MM7)
[-] My bug: crash when loading custom lods (don't know how it even worked at all!)
[-] Out-of-bounds memory read in buy dialog when no player is active
[-] Shops were buying blasters
[*] Now left click (while holding right button) not only cancels right button menu, but also performs action
(MM7, MM8)
[-] Black border around sprites and sea shore in D3D
[-] Broken but unidentified items were green instead of red if you go to a shop to repair them.
[-] Casting Telepathy spell or stealing from a monster used to prevent you from finding random items in its corpses
[-] Light gray blinking in full screen on some computers
[-] Arcomage crashing, hanging
[-] Loading game while in turn based mode leading to inability to cast spells
[-] Monsters summoned by other monsters had wrong monster as their ally
[-] The game was using "asynchronous" mouse handling incompatible with mouse look of the patch if "D3D Device" = 1 in the registry. Hidden "DisableAsyncMouse" patch option controls this.
[-] items.txt: now special items accept standard English "of ..." strings. This should fix a number of localizations
[-] Shops were unable to fix some artifacts
[-] Lava was hurting players in air
[-] Memory leak in mipmaps generation code
[*] ReputationNumber option now shows positive values for good reputation. Before it showed negative values, just like it's represented internally in the game.
(MM7)
[-] My bug: Axe skill adding damage at expert level instead of master
[-] GM Staff ignoring Armsmaster bonus to Damage
[-] Taledon's Helm not increasing Light Magic
[-] My bug: Palettes were messed up in Avlee
[-] My bug: FixChests=1 was broken - event execution was stopped after the chest is opened
[-] From Black Phantom patch...
[-] Monsters summoning wrong monsters (e.g. Archmages summoning Sylphs)
[-] Pressing Alt+Tab during the win movie 'breaking' the game

Version 2.2:
(MM6 - MM8)
[+] Resizeable window
[+] StretchWidth, StretchHeight, StretchWidthFull, StretchHeightFull
[+] Now in Software rendering mode the view is always scaled linearly, which makes it less flickery
[+] MouseLookCursorHD
[+] Quick load key works during the death movie
[+] Patch now bypasses dgVoodoo DLLs if SupportTrueColor is not disabled
[+] Minimaps zoom level is remembered indoors, not just outdoors as before
[+] Customizable mouse cursor: Data\MouseCursorArrow.cur and Data\MouseCursorTarget.cur are used if present
[-] Fixed a crash due to facet interception checking out-of-bounds (found in Tatalia in MM7)
[-] Inactive characters couldn't interact with chests
[-] TFT.bin was animated incorrectly (first frame was longer, last frame was shorter)
[-] My bug: ScalingParam2 was read from ScalingParam1 entry
[-] My bug: Mouse position translation was wrong
[*] Smarter FixInactivePlayersActing
(MM7, MM8)
[+] Accurate sprites coordinates in D3D
[+] Accurate mouse in HD mode
[+] TurnBasedWalkDelay
[+] MipmapsBase
[+] HDWTRCountHWL, HDWTRDelayHWL
[+] Hidden FixMonsterSummon option
[-] Combining IsWater and AnimateTFT caused texture change in D3D
[-] Fixed a rare crash caused by a facet without a single vertex
[-] My bug: Sparks effect was displayed incorrectly in the previous version
(MM7)
[+] Bless etc. icons near player portrait can be transparent
[-] Decorations were displayed shrinked vertically in D3D mode
[-] Fly and Water Walk icons weren't displayed in simple message dialog
[-] Health bars of first 2 players and danger indicators of all players were misplaced (FixInterfaceBugs hidden option)

Version 2.3:
(MM6-MM8)
[+] PaperDollInChests
[+] Keyboard control
[+] Enter in save/load dialogs
[-] My bug: If somehow game window managed to become smaller than 640x480, it wasn't handled gracefully in software 32-bit color mode.
(MM6, MM7)
[-] My bug: Quick load key during the death movie was causing a crash afterwards
(MM7, MM8)
[+] Widescreen support with new UI
[+] Better blackening of background in moster info window (almost doesn't matter for users)
[+] In D3D the game was prioritizing interacting with sprites on sides of the view too often
[+] Accurate effects coordinates in D3D
[+] Accurate coordinates of top part of the outdoor sky in D3D
[-] In D3D on right/left sides of the screen bottom of sprites didn't react to clicks indoors
[-] One bitmap loading function was unable to load uncompressed bitmaps
[-] My bug: Precise mouse targeting wasn't working
(MM7)
[+] HigherCloseRingsButton
[-] 'close rings view' in inventory was misplaced
[-] Sound issue - quick load during taking damage

Version 2.3.1:
(MM7, MM8)
[+] A few new UI layout commands
[-] My bug: ScalingParam1 and ScalingParam2 were ignored in flexible UI mode

Version 2.4:
(MM6-MM8)
[+] FixChestsByCompacting
[+] PlaceChestItemsVertically
[+] SpriteAngleCompensation
[+] PostponeIntro
[+] ClickThroughEffects
[+] DisableHooks
[+] Map entrance dialog can now be called from NPC topic anywhere
[-] FixSFT - SFT.bin was animated incorrectly (first frame was longer, last frame was shorter)
[-] My bug: keyboard control of dialogs was breaking evt.Question in houses
(MM7, MM8)
[+] bitmaps.lwd support
[+] TrueColorTextures
[+] TreeHints
[+] Better D3D init errors reporting
[-] SpriteInteractIgnoreId
[-] GM Axe didn't halve armor class
[-] Disease2 and Disease3 bonus effects of monsters weren't working, Disease1 was working as Disease3
[-] Poison2 and Poison3 bonus effects of monsters were swapped
[-] My/DirectX bug: Game was failing to start in big resolutions, because Direct3D 7 doesn't work with them
[-] My bug: The game could crash when pressing Esc in UI Layout mode
[-] My bug: Out-of-bounds write when layout definition has long loops
[-] My bug caused by Delphi bug: numbers in some layout expressions were read incorrectly
[-] My bug: Memory leak when UI layout is reloaded
(MM7)
[+] SupportMM7ResTool
[-] 'Of Spirit Magic' effect of Glory Shield wasn't working
[-] 'Water walking' effect of Lady's Escort wasn't working
[-] Pressing space was closing evt.Question dialog
[-] My bug: Input field of evt.Question command dialog wasn't shown in UI Layout mode with statusbar auto-hide


[!!] MouseLookShooterAim
[!!] HD sprites
[!!] Smooth video sides
[!!] Prioritize geometry near the center
[!!] Night sky, better day/night cycle, sun?
[!!] Different configs for mouse look/no mouse look? No HKLM
[!!] What about adding a right-click option that lets you exit conversations and houses?
[!!] Configurable (Caps Lock) key for mouse look
[!!] textures from bitmaps (and option to change their gamma or not to change??)


(andrey:) It was in MM7&8 since the beginning of time even with very late patches, but I can't say
 if it is still there in the latest patch or whether it even exists in MM678 merge.
- Monsters fight each other 2 vs 1
- 2 monsters deal the killing blow simultaneously
- One blow kills the monster and another blow is assigned to you (with all bad effects).
Does not happen all the time, but seems to happen quite consistently when you are the next
 target of the monsters.


The "-30 Earth Resistance" on the relic, Kelebrim, does not work.

- if whole party dies Zombies lose "zombie" status, but portrait gets stuck

- walking in turn-based mode - Macros the Black: I think we're supposed to be able
 to take 5 individual steps instead of just leaping in one direction

- anisatropic & antialiasing

Darkloke best:

- ��� ����������� �� ������������ StealItem ������� ����������� ������ �������
���������� ���� � �� ������.
- ����� ini-�����: �������������� ������������ � double speed mode ���
������������ � ��������� ����� � �������������� ������� � �������� ������ ���
������ �� ����.
- ������ � ��� � ��������� �� �������� ��������� ��� ������� �� ������� ������,
 ����� ������� �� ���� ������ �������� (������ ���� �����������).
 ���� �� ������� �������� �� ���. ������� (�������� ������ �� ������� ������,
 �����, ����� ������� � �.�.) ������� ������ � ����� ������, ���� �� �����
 ���� �������� ������� �������.

Darkloke:

1. ����������� � ���������� ������� ������ ����� (�������� ��� ������ � �������� � ������ ������� �� ���'��).
2. ����������� � ���������� ���������� ������� � ����, ��������:
����   25 (+5) / 21 (+4)
5. ��� �������� ������������� ���������� ������� �������� ����� � % � ���������� � ������� ���� �������.
4. � ���������� � ������� ���� Q, ����������� ��������, �������� ����� ����� ������� � �� ��������� �������� ��������� ������� ������� � % ���� ��������� �� ���� (� ����������� �� ������� - ����/������).
11. �������� � �������� ������� �� "������� ��������" ����������.
8. �������� � ��������� ������� ������ � ���� ������� �� ���������.

10. �������� recoveryTime � ������ � ����� ��������.
6. �������� � ��������� ��������������� ������������� ������� ��� �� ������� (http://www.pottsland.com/mm6/attributes2.shtml).
7. �������� ����������� ���� (����������� ��������) ��������� �������� ������ (����� �������� �� ��������� ������ ������).
13. ���������� � ��������� ���������� ���������� � ��� ������� "��������": �����������������, ������, ���� � �.�.
15. ������� �������, ����������� �������� ���������� (���������, ����� ����������, �����, ����� � �.�.) ��� ��������� ������� ��������� ��.

- ��������������� ������: ������ ��� � ������� ������ ��� ����� ������� ��. ������� - ���� ������ �������� � ������� ����, ����� ������������ ���� ���������; � ��������� ������� ���� ��� �������� � ���� �� �������������, ����� ������ ������ �������� � ���� (�������������) - �� ����������� ������� � �������������.
��������� � �������: �� ������� �������� ������, ���������� � ��������� (�������� ��������, �������� � ��.).
��������� � �������: ������ � ���� ������� �� ���������.
��������� ����������: ���������� � ��� ������� (������ �� ������� � �������) "��������": �����������������, ������, ���� � �.�.

��� �������� ������������� ���������� ������� �������� ����� � % � ���������� � ������� ���� �������.

������, �� ���� � ���������� ���������� recoverytime... ����� �� �������� ������ ������, ������������ ����� ������ ������� ������ ����� � ����������? ������ � ��������� ��� ��� ������ - ��� % �� ������, � � ����� ��������� ��� � +�� ���'��

����, ���-�� �� ���� �����... �� ���� ��������� - � ��6 ����� �� ���� �������� ��������������, � �� ������������ (��� � DnD) - ������� ���� ������� ������� �� � ������� � ������� ����� �������� � ���� +/- X.

��� ���� ���� - ����� ��������� ������� ���� Q, ������� � ������������ �������� ������� ��� ����� ����� � �� ��������� �������� ��������� ������� ������� � % ���� ��������� �� ���� (� ����������� �� ������� - ����/������)

�������� ����������� ���� (����������� ��������) ��������� �������� ������ (����� �������� �� ��������� ������ ������). � ������� ����� ������ �������� ��� �� ����� ������ ��������� ��������, ��������������, ������, ��������� � �.�.


����� Awards �� ����������� ��� ������� Tab (���������� � ������� ��������� �������� ���� ��).
 ��� ������ ������� ��������� ����� ����� ����������� � ������� ������������.

��7 ������������� ������� �� ����  + �������  (� ��� ���� ����) + MM7 Patch Buka v1.5.1
 � ������������ ������ = �� �������� ������� (����� ���������� �������) ������� � �����������,
 ������� ����� �������� �������� ������. ������ �����, ��� "����� ������ ���".

�� ������� � ������� ������� � ������� �� ������������ ����� (����� "����� ������ ���"), � ��� �� ������� ������� ��� ���������. � ��������� � ������ ����� ��� � �������. �� ������ ������ �������� � ��������� ���� �������, �� ��� � �� ������� ������� �� ���������.
���������� �� ���� ����� (� ������� ������� ���������) ������� ������� ������� ���� � Fort Riverstride � ������. � �������� ����� � ����������� � ������ ������� � Mist � Celeste.

����� "�������������" ���, ��� ������� � ����� ����
�������� �������� -30 � ������������ � ����� �� ��������


- When a Staff is used in conjunction with the Unarmed skill (at
Grandmaster), the Master Armsmaster skill bonus to the damage is not
acknowledged by the game. The damage is only higher by 12 points with a
Wizard Staff. Armsmaster bonus to Attack Bonus is applied, though, (or not?) as is
probably the recovery speed bonus.

- MM7: Sometimes when you see an erudine-laced ore on the ground, it's in
actuality a kergar-laced ore, which you see when you right-click on it. It's
nothing more than a sprite-matching error in the game, but I decided to include it.

- Also, don't forget about the bug I told you about a while earlier - monsters
 with instant targeting spells can't actually use them. In MM8 that goes for
 Greater Air Elementals with their Implosion, Greater Earth Elementals with
 their Mass Distortion and Plane/Chaos Overlords/Protectors/Guardians with
 their Paralyze. I dunno if any monsters in MM7 could use such spells.

- Even if you choose the Path of Dark, after doing the Lich quest (with
exiting the Walls of Mist by its rear entrance), the game treats it as
though you completed the test on the Light side and changes your banner
from the Necromancers' to the Wizards'. It's purely cosmetic, but a bug
nonetheless.

- The Vampire quest that one of the Light advisors gives you is to kill a
certain vampire in the Wine Cellar in Tatalia. What you have to do,
however, is just to enter that wine cellar and then leave it. This should
be adjusted - the mission requirement should be to kill the Elder Vampire
who carries the Vampire's Cape (he seems to be a 100% chance spawn).

- After finishing MM7, the quest log for the Final Task won't disappear
from the journal. Also, the final note from the Historian will not be
there, like it is in MM8. I have no idea if this last note is coded or not,
but if it is, you could try to bring it out :)

- The bow with + Bow skill won't add to recovery (and damage if the wielder is a
Grandmaster). This is also true to MM8. The bows are Ania Selving and Tournament
Bow, I think

- Any advice given by the Judge doesn't appear in the Seer rubric, like it
does in MM8. This is obviously a bug. If you visit the Seer and ask him for
advice it will display correctly, but you won't get that cute "beep" sound
and the flashy animation, and the advice won't get recorded in your notes.

- Using the Telepathy spell on a monster makes it not drop the item it was
shown by the spell to carry. The gold is still there, but the item is lost.
This is an issue in both MM7 and 8.
I think you should seriously consider doing something about the Telepathy bug.
It's annoying when you cast it on a monster and it says "1032 gold and an item
(relic)" (or any other item with the potential for being unique in MM8), and
when you loot the monster you get only 1032 gold. Kinda defeats the whole
purpose of having the spell.

- In the altar pieces quest on the Dark side, Kastore doesn't recognize the
key halves. Even if you bring him the one from the temple of light, he
still says "good job recovering OUR half of the key, but you still need
theirs". This problem isn't there on the path of Light, as Resurrectra
correctly recognizes the enemy piece of the altar if you show it to her
first. Not too important, but worth fixing for perfection's sake.

- "The club bug" - no attack sound played when swinging a club, and its
recovery is almost nonexistent. - both in MM7 and 8.

- The Haste spell doesn't seem to shorten recovery time from casting
spells. (both MM7 and 8). Looks like Mok fixed it only for weapons.

- In MM7 many quests don't appear in the Awards section upon completion.
This needs a double-check.

- When you point your mouse over The Oldest Tree, you get a subtitle
"tree69". Awkwarrrrd ;p

- The Heal spell is supposed to be cast on distant targets starting at
Expert in Body Magic--it can be, however, from the very beginning, even
with basic skill. This should be fixed in both MM7 and 8.

Xfing:

- Character Awards do not display the count of Arcomage wins, only losses. It doesn't display in which inns you've won either, but I think this has always been a MM8-only thing anyway.
- the "remove magical aging" portion of the Sacrifice spell doesn't work.
- There are 8 chest images in sprites.lod, yet the game only ever uses the 1st one. Some of the others could be put to use, I believe - especially since they fit!
- Instant hit spells on monsters do not work (Paralyze on Wizards). Also present in MM8
- The dual-wielding damage calculation bug that I've made another thread about.
- Not sure if the Shield spell or the "of Shielding" effect/GM Shield perk works properly.
- I think thresholds on items in regards to their identification and repair should be raised. As things are now, 30 points in ID/Repair is enough to handle the best items in the game, which defeats the purpose of Grandmaster training entirely. I suggest to raise the threshold for artifacts and relics to 45 (or 45 and 60 respectively if these two categories can be done separately) to make GM in these two skills even worth obtaining.
}

begin
  try
    AssertErrorProc:= RSAssertErrorHandler;
    LoadIni;
    HookAll;
    Randomize;
    LoadExeMods;
    
  except
    ShowException(ExceptObject, ExceptAddr);
  end;
end.
