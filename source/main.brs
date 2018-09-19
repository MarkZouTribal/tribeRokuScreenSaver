Function RunScreenSaver(params as Object) as Object 'Required entrypoint for screensavers
    main()
End Function

Function main() as Void 'Optional entrypoint so screensaver can be run as a channel
    screen = createObject("roSGScreen")
    m.port = createObject("roMessagePort")

    screen.setMessagePort(m.port)

    scene = screen.createScene("HomeScreensaver") 'Create Scene called HomeScreensaver
    screen.Show()

    while(true) 'While loop that fires every 8 seconds to change (Global) MyField value. It also checks to see if app is closed
        scene.fireTimer = true
        msg = wait(3000, m.port)
        if (msg <> invalid)
            msgType = type(msg)
            if msgType = "roSGScreenEvent"
                if msg.isScreenClosed() then return
            end if
        end if
    end while

end Function
