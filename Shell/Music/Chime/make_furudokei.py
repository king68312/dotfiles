import os

def create_midi():
    # MIDIのバイナリデータを直接構築する
    # ヘッダーチャンク (MThd)
    header = b'MThd' + int(6).to_bytes(4, 'big') + int(0).to_bytes(2, 'big') + int(1).to_bytes(2, 'big') + int(480).to_bytes(2, 'big')
    
    # トラックデータ (MTrk)
    track_data = bytearray()
    
    # テンポ設定 (BPM 85 -> 1拍 = 705,882マイクロ秒)
    # 705882 = 0x0AC54A
    track_data += b'\x00\xFF\x51\x03\x0A\xC5\x4A'
    
    # 「大きな古時計」音階 (60=ド, 64=ミ, 67=ソ...)
    melody = [
        60, 64, 67, 72, 74, 72, 69, 67,
        72, 67, 64, 62, 60, 62, 64, 62,
        60, 64, 67, 72, 74, 72, 69, 67,
        72, 64, 62, 64, 60,
        67, 69, 67, 64, 67, 69, 67, 64,
        72, 69, 67, 64, 62,
        60, 64, 67, 72, 74, 72, 69, 67,
        72, 64, 62, 64, 60
    ]
    
    # 各音符の長さ（480 = 1拍/4分音符）
    durations = [
        480, 480, 480, 480, 480, 480, 480, 480,
        480, 480, 480, 480, 480, 480, 480, 960,
        480, 480, 480, 480, 480, 480, 480, 480,
        720, 240, 480, 480, 960,
        720, 240, 480, 480, 720, 240, 480, 480,
        720, 240, 480, 480, 960,
        480, 480, 480, 480, 480, 480, 480, 480,
        720, 240, 480, 480, 960
    ]
    
    # 音符データをMIDIイベントに変換
    for note, dur in zip(melody, durations):
        # Note On (ベロシティ 90)
        track_data += b'\x00\x90' + bytes([note, 90])
        
        # デルタタイム（音の長さ）の可変長バイト表現
        d_bytes = bytearray()
        v = dur
        d_bytes.append(v & 0x7F)
        while v > 0x7F:
            v >>= 7
            d_bytes.insert(0, (v & 0x7F) | 0x80)
            
        track_data += d_bytes
        # Note Off
        track_data += b'\x80' + bytes([note, 0])
        # 次のノートオンまでの時間（0）
        track_data += b'\x00'
        
    # トラックの終端イベント
    track_data += b'\xFF\x2F\x00'
    
    # トラックチャンク組み立て
    track = b'MTrk' + len(track_data).to_bytes(4, 'big') + track_data
    
    # ファイル書き出し
    path = os.path.expanduser("~/Music/Chime/02.mid")
    os.makedirs(os.path.dirname(path), exist_ok=True)
    with open(path, "wb") as f:
        f.write(header + track)
    print("🎵 依存関係なしで '大きな古時計' のMIDI (02.mid) を生成しました！")

if __name__ == "__main__":
    create_midi()
