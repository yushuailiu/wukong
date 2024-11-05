/**
 * MIT License
 * 
 * Copyright (c) 2024 刘帅
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package wukong

import std.collection.*
import std.os.*

public class Command {

    private var use: String

    private let commandGroups: ArrayList<Group> = ArrayList<Group>()
    
    private let subCommands: ArrayList<Command> = ArrayList<Command>()

    private let args: ArrayList<String> = ArrayList<String>()

    private var run: (cmd: Command, args: ArrayList<String>) -> Unit

    public init(use: String) {
        this.use = use;
        func defaultRun(cmd: Command, args: ArrayList<String>) {
        }
        this.run = defaultRun
    }

    public func getUse(): String {
        return use
    }


    public func addGroup(group: Group) {
        for (itemGroup in commandGroups) {
            if (itemGroup.ID == group.ID) {
                throw WKException("Group ID already exists")
            }
        }
        commandGroups.append(group)
    }

    public func getCommandGroups(): ArrayList<Group> {
        return commandGroups
    }

    public func addCommand(commands: ArrayList<Command>) {
        for (command in commands) {
            this.subCommands.append(command)
        }
    }

    protected func setArgs(args: ArrayList<String>) {
        this.args.clear();
        this.args.appendAll(args)
    }

    protected func setRun(run: (cmd: Command, args: ArrayList<String>) -> Unit) {
        this.run = run
    }


    public func execute() {
        if (args.size == 0) {
            this.args.appendAll(ArrayList<String>(getArgs()))
        }
        println(args)

        println(args.size)

        println(args)

        println(args)

        run(this, args)

        return args
    }
}