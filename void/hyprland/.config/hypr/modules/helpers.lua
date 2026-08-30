-- Shared helpers.
-- Returns a table; every module that needs utilities requires this module.

local M = { cache = {} }

local raw_has
if io and io.popen then
    raw_has = function(prog)
        local handle = io.popen("command -v " .. prog .. " 2>/dev/null")
        if not handle then
            return false
        end
        local out = handle:read("*l")
        handle:close()
        return out ~= nil and out ~= ""
    end
else
    -- No os-level io available; assume the command exists so binds stay active.
    raw_has = function()
        return true
    end
end

-- Check whether a command is on PATH.
-- Accepts a full command line, only the leading program name is looked up.
-- Results are memoized.
function M.has(cmd)
    if type(cmd) ~= "string" then
        return false
    end
    local prog = cmd:match("^%s*(%S+)")
    if not prog or prog == "" then
        return false
    end
    if M.cache[prog] ~= nil then
        return M.cache[prog]
    end
    local ok = pcall(raw_has, prog)
    M.cache[prog] = ok == true
    return M.cache[prog]
end

-- Named helper: the programs we keep in `apps`. Returns just the root name.
function M.bin(cmd)
    return cmd:match("^%s*(%S+)")
end

return M