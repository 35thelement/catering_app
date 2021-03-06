// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket,
// and connect at the socket path in "lib/web/endpoint.ex".
//
// Pass the token on params as below. Or remove it
// from the params if you are not using authentication.
import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})
window.socket = socket

// When you connect, you'll often need to authenticate the client.
// For example, imagine you have an authentication plug, `MyAuth`,
// which authenticates the session and assigns a `:current_user`.
// If the current user exists you can assign the user's token in
// the connection for use in the layout.
//
// In your "lib/web/router.ex":
//
//     pipeline :browser do
//       ...
//       plug MyAuth
//       plug :put_user_token
//     end
//
//     defp put_user_token(conn, _) do
//       if current_user = conn.assigns[:current_user] do
//         token = Phoenix.Token.sign(conn, "user socket", current_user.id)
//         assign(conn, :user_token, token)
//       else
//         conn
//       end
//     end
//
// Now you need to pass this token to JavaScript. You can do so
// inside a script tag in "lib/web/templates/layout/app.html.eex":
//
//     <script>window.userToken = "<%= assigns[:user_token] %>";</script>
//
// You will need to verify the user token in the "connect/3" function
// in "lib/web/channels/user_socket.ex":
//
//     def connect(%{"token" => token}, socket, _connect_info) do
//       # max_age: 1209600 is equivalent to two weeks in seconds
//       case Phoenix.Token.verify(socket, "user socket", token, max_age: 1209600) do
//         {:ok, user_id} ->
//           {:ok, assign(socket, :user, user_id)}
//         {:error, reason} ->
//           :error
//       end
//     end
//
// Finally, connect to the socket:
socket.connect()

let channel = socket.channel("tangerine:all", {})

channel.join()
  .receive("ok", resp => { console.log("Joined successfully", resp) })
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.on("add_user", (user)=>{
  if (document.getElementById(user.is_caterer)) {
    var table = document.getElementById("userTable");
    var row = table.insertRow(1);
    var cell1 = row.insertCell(0);
    var cell2 = row.insertCell(1);
    var cell3 = row.insertCell(2);
    if (document.getElementById("admin")) {
      if (user.is_caterer === "true") {
        cell1.innerHTML = "Caterer: "
      }
      else if (user.admin === "true") {
        cell1.innerHTML = "Admin: "
      }
      else {
        cell1.innerHTML = "Client: "
      }
      cell1.innerHTML += user.username;
    }
    else {
      cell1.innerHTML = user.username;
    }
    cell2.innerHTML = user.bio;
    cell3.innerHTML = "Refresh Page";
  }
})

if (window.channelName) {
  let channel2 = socket.channel(window.channelName, {})

  channel2.join()
    .receive("ok", resp => { console.log("Joined Menu Channel successfully", resp) })
    .receive("error", resp => { console.log("Unable to join", resp) })

  channel2.on("change_menu", (menu)=>{
    if (menu.preferences) {
      $("#preferences").val(menu.preferences)
      $("#feedback").val(menu.feedback)
    }
    else {
      $("#dish1").val(menu.dish1)
      $("#dish2").val(menu.dish2)
      $("#dish3").val(menu.dish3)
      $("#dish4").val(menu.dish4)
      $("#dish5").val(menu.dish5)
    }
  })
}


export default socket
