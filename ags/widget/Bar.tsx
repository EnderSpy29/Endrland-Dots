import { App } from "astal/gtk3"
import { Variable, GLib, bind } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk3"
import Hyprland from "gi://AstalHyprland"
import Mpris from "gi://AstalMpris"
import Wp from "gi://AstalWp"
import Tray from "gi://AstalTray"
import Notifd from "gi://AstalNotifd"
import Pango from "gi://Pango"

function Volume() {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!
    return <box className="Volume" css="min-width: 125px">
        <icon icon={bind(speaker, "volumeIcon")} />
        <slider
            hexpand
            onDragged={({ value }) => speaker.volume = value}
            value={bind(speaker, "volume")}
        />
    </box>
}

function MediaWidget( {player} : {player: Mpris.Player}) {
    return  <button onClick={() => player.play_pause()}>
              <label max_width_chars={12} ellipsize={Pango.EllipsizeMode.END} label={bind(player, "title")} />
            </button>
  }

  function Media() {
      const music = Mpris.Player.new("spotify");
      const mpris = Mpris.get_default();
      return <box className="Media">
        {bind(mpris, "players").as(ps => {
          if(music.available) return <MediaWidget player={music}/>
          else if(ps.length > 0) return <MediaWidget player={ps[0]} />
          else return <button max_width_chars={12} ellipsize={Pango.EllipsizeMode.END} label=" Nothing. "/>
        })}
      </box>
  }

function Workspaces() {
    const hypr = Hyprland.get_default()
    return <box className="Workspaces">
        {bind(hypr, "workspaces").as(wss => wss
            .sort((a, b) => a.id - b.id)
            .map(ws => (
                <button
                    className={bind(hypr, "focusedWorkspace").as(fw =>
                        ws === fw ? "focused" : "")}
                    onClicked={() => ws.focus()}>
                    {ws.id}
                </button>
            ))
        )}
    </box>
}

function SysTray() {
    const tray = Tray.get_default()

    return <box className="SysTray">
        {bind(tray, "items").as(items => items.map(item => (
            <menubutton
                tooltipMarkup={bind(item, "tooltipMarkup")}
                usePopover={false}
                actionGroup={bind(item, "action-group").as(ag => ["dbusmenu", ag])}
                menuModel={bind(item, "menu-model")}>
                <icon gicon={bind(item, "gicon")} />
            </menubutton>
        )))}
    </box>
}

function Time({ format = " %H:%M - %b %e. " }) {
    const time = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format(format)!)
    return <label
        className="Time"
        onDestroy={() => time.drop()}
        label={time()}
    />
}

// Make this use a Variable or something idk
function Notification(){
    const notifd = Notifd.get_default()
    const label = <label max_width_chars={35} ellipsize={Pango.EllipsizeMode.END}/>
    const handlerId = notifd.connect("notified", (n, id, r) => {
      label.label = notifd.get_notification(id).summary
    })
    return <button className="Notifcolor" onDestroy={()=>notifd.disconnect(handlerId)}>{label}</button>
}

function Leftbar(){
    return <box halign={Gtk.Align.START}>
        <Workspaces />
    </box>
}

function Middlebar(){
    return <box>
        <Volume />
        <Notification />
        <Media />
    </box>
}

function Rightbar(){
return <box halign={Gtk.Align.END}>
    <Time />
    <SysTray />
</box>
}

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const anchor = Astal.WindowAnchor.TOP
        | Astal.WindowAnchor.LEFT
        | Astal.WindowAnchor.RIGHT

        return <window
        className="Bar"
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={anchor}
        application={App}>
        <centerbox>
        <Leftbar />
        <Middlebar />
        <Rightbar />
        </centerbox>
    </window>
}