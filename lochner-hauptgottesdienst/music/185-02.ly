\version "2.24.3"
% Scan 185, printed p. 160: Festival Alleluia a, L. Lossius 1553.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}


\score {
  <<
    \new PianoStaff <<
      \new Staff <<
        \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice = "sung" { \voiceOne r2 a'4 a'4 \bar "|" a'2( g'2) \bar "|" f'2 c''4 d''4 \bar "|"
          c''2( bes'2) \bar "|" a'2 a'4 a'4 \bar "|" \break
          a'2( g'2) \bar "|" f'2 g'4 g'4 \bar "|"
          g'4( a'4 f'2) \bar "|" f'1 \bar "|." }
        \new Voice { \voiceTwo s2 f'4 f'4 f'2( e'2) f'2 f'4 f'4
          e'2( d'4 e'4) f'2 f'4 f'4
          f'2( e'2) f'2 d'4 d'4
          e'4( f'4 d'2) c'1 }
      >>
      \new Lyrics \lyricsto "sung" {
        \set ignoreMelismata = ##t
        "Hal :" "le :" "lu : : :" \skip 1 "ja!"
        "Hal :" "le :" "lu : : : :" \skip 1 "ja!"
        "Hal :" "le :" "lu : : :" \skip 1 "ja!"
        "Hal :" "le :" "lu : : : : : : :" \skip 1 \skip 1 "ja!"
      }
      \new Staff <<
        \clef bass \key f \major \cadenzaOn \omit Staff.TimeSignature
        \new Voice { \voiceOne r2 c'4 c'4 c'1 a2 a4 bes4
          g2( bes2) c'2 c'4 c'4
          c'1 a2 bes4 bes4 c'2( bes2) a1 }
        \new Voice { \voiceTwo s2 f4 f4 f2( c2) f2 f4 bes,4
          c2( g2) f2 f4 f4
          f2( c2) d2 g,4 g,4
          c4( f,4 bes,4 d4) f1 }
      >>
    >>
  >>
  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
