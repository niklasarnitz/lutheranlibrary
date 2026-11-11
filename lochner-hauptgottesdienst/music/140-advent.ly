\version "2.24.3"
% Scan 140, printed p. 115: full Advent Kyrie page.
#(set-global-staff-size 15)
\header { tagline = ##f }
\paper { paper-width = 124\mm left-margin = 4\mm right-margin = 0\mm top-margin = 0\mm bottom-margin = 0\mm indent = 0\mm print-page-number = ##f page-breaking = #ly:one-page-breaking }
shortBar = { \bar "," }
\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \key f \major \omit Staff.TimeSignature \cadenzaOn \accidentalStyle forget
      \new Voice = "sung" { \voiceOne
        f'2 e'4 d'4 \shortBar e'2 c'2 \bar "|" r4 f'4 e'4 d'4 \shortBar e'2 f'2 \bar "||" c''2 d''4 e''4 \shortBar c''1 \bar "|" \break
        r4 f''4 e''4 d''4 \shortBar e''2 c''2 \shortBar a'2 f'4 e'4 \shortBar f'4 e'4 e'2 \shortBar f'2 \bar "|" \break
        r4 g'4 \shortBar g'4 f'4 e'4 d'4 \shortBar e'2 c'2 \bar "|" r4 f'4 e'4 d'4 \shortBar e'2 f'2 \bar "||"
      }
      \new Voice { \voiceTwo
        c'2 c'4 b!4 c'2 c'2 r4 c'4 c'4 a4 c'2 c'2 a'4( g'4) f'4 g'4 a'1 \break
        r4 a'4 f'4 f'4 f'2 d'2 d'4.( e'8) d'4 d'4 bes4 d'4 c'2 c'2 \break
        r4 e'4 d'4 c'4 c'4 b!4 c'2 c'2 r4 c'4 c'4 a4 c'2 c'2
      }
    >>
    \new Lyrics \lyricsto "sung" { \set ignoreMelismata = ##t
      frei off -- ner Heils -- "bronn," er -- barm dich un -- "ser!" Hei -- li -- ger "Geist,"
      der Kir -- che Trö -- "ster," du al -- ler -- be -- ster Mei -- "ster,"
      Er -- neu -- rer und Re -- gie -- "rer," er -- barm dich un -- "ser!"
    }
    \new Staff <<
      \clef bass \key f \major \omit Staff.TimeSignature \cadenzaOn \accidentalStyle forget
      \new Voice { \voiceOne
        a2 g4 g4 g2 g2 r4 a4 g4 f4 g2 a2 f4( g4) a4 c'4 c'1 \break
        r4 c'4 c'4 b!4 c'2 c'2 s4 g8[ a8(] bes4) c'4 a4 bes4 g2 a2 \break
        r4 c'4 b!4 a4 g4 g4 g2 g2 r4 a4 g4 f4 g2 a2
      }
      \new Voice { \voiceTwo
        f2 c4 g4 c2 c2 r4 f4 c4 d4 c2 g,2 f4( e4) d4 c4 f1 \break
        r4 f4 bes,4 f4 bes,2 bes,2 g2 f4 c4 f4 bes,4 c2 f2 \break
        r4 bes,4 g,4 bes,4 d4 g,4 d2 d2 r4 f4 c4 d4 c2 g,2
      }
    >>
  >>
  \layout { ragged-right = ##f \context { \Score \remove "Bar_number_engraver" \autoBeamOff } \context { \Staff \override BarLine.short-bar-extent = #'(0 . 2) } \context { \Lyrics \override LyricText.font-size = #-2 } }
}
